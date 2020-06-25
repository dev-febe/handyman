<?php

namespace App\Http\Controllers\Api\Auth;

use App\Events\Auth\SocialLogin;
use App\Models\Auth\Role\Role;
use App\Models\Auth\User\SocialAccount;
use App\Models\Auth\User\User;
use Firebase\JWT\JWT;
use Google_Client;
use Illuminate\Foundation\Auth\RedirectsUsers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

class SocialLoginController extends Controller
{
    public function authenticate(Request $request)
    {
        $request->validate(['platform' => 'required|in:google,facebook,apple',
        'token' => 'required',
        'os' => 'sometimes|in:android,ios',
        'role' => 'sometimes'
        ]);
        
        try {
            $email = null;
            $name = null;
            
            if($request->platform == 'google') {
                $client_id_env_key = $this->_getGoogleClientId($request->get('os', 'android'), $request->role);
                $email = $this->_googleLogin($request->token, $client_id_env_key);
            }
            
            if($request->platform == 'facebook') {
                $data = $this->_facebookLogin($request->token);
                $email = $data['email'];
                $name = $data['name'];
            }

            if($request->platform == 'apple') {
                $email = $this->_appleLogin($request);
            }
            
            if($email == null) {
                return response()->json(["message" => 'Email not found from token'], 400);
            }
            
            $user = User::where('email', $email)->first();
            
            if(!$user) {
                return response()->json(["message" => 'User does not exist', "name" => $name, "email" => $email], 404);
            }
            
            $token = $user->createToken('Default')->accessToken;
            return response()->json(["token" => $token, "user" => $user]);
        } catch(\Exception $ex) {
            throw new BadRequestHttpException($ex->getMessage());
        }
    }
    
    private function _googleLogin($token, $client_id_env_key) {

        $client_id = env($client_id_env_key, null);
        
        if($client_id == null) {
            throw new \Exception('Google Client ID not configured on server');
        }
        
        $client = new Google_Client(['client_id' => $client_id]);  // Specify the CLIENT_ID of the app that accesses the backend
        $payload = $client->verifyIdToken($token);
        if ($payload) {
            return $payload['email'];
        }
        throw new \Exception('Invalid Google Token');
    }
    
    private function _facebookLogin($token) {
        // https://github.com/facebook/php-graph-sdk
        $app_id = env('FACEBOOK_APP_ID', null);
        $app_secret = env('FACEBOOK_APP_SECRET', null);
        
        $fb = new \Facebook\Facebook(['app_id' => $app_id,
        'app_secret' => $app_secret,
        'default_graph_version' => 'v2.10'
        ]);
        
        try {
            $response = $fb->get('/me?fields=name,email', $token);
            $me = $response->getGraphUser();
            return ["email" => $me->getEmail(), "name"  => $me->getName()];
        } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            throw new \Exception('Graph returned an error: ' . $e->getMessage());
        } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            throw new \Exception('Facebook SDK returned an error: ' . $e->getMessage());
        }
    }

    private function _appleLogin($request) {
        $publicKeyURL = 'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com';
        $kids = json_decode(file_get_contents($publicKeyURL), true);

        if($request->token) {
            try {
                $decoded = JWT::decode($request->token, $kids, array('RS256'));

                if($decoded->iss !== env('FIREBASE_ISS')) {
                    throw new \Exception('ISS mismatch');
                }

                return $decoded->email;
            } catch(\Exception $ex) {
                throw new BadRequestHttpException($ex->getMessage());
            }
        }
        throw new BadRequestHttpException('Invalid token');
    }
    
     private function _getGoogleClientId($os, $role) {
        $client_id_env_key = $os == 'android' ? 'GOOGLE_CLIENT_ID' : 'GOOGLE_IOS_CLIENT_ID';
        if($os == 'ios' && $role == 'provider') {
            $client_id_env_key = 'GOOGLE_IOS_PROVIDER_CLIENT_ID';
        }
        return $client_id_env_key;
     }
}
