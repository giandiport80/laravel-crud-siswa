<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SiteController extends Controller
{
    public function index()
    {
        return view('sites.home');
    }

    public function about()
    {
        return view('sites.about');
    }
}
