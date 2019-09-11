<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->category_id) {
            $categories = Category::where('parent_id', $request->category_id);
	} else if($request->search_subcategory) {
	    // search in subcategory
	    $categories = Category::where('title', 'like', "%" . $request->search_subcategory . "%")->whereNotNull('parent_id');
	} else {
            $categories = Category::whereNull('parent_id');
        }

        // search
        if($request->search) {
            $categories = $categories->where('title', 'like', "%" . $request->search . "%");
        }

        $categories = $categories->orderBy('title', 'desc')->paginate(50);
        return response()->json($categories);
    }
}
