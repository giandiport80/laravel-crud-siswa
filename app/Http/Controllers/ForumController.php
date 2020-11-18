<?php

namespace App\Http\Controllers;

use App\Forum;
use Illuminate\Http\Request;

class ForumController extends Controller
{
    public function index()
    {
        $forum = Forum::paginate(10);

        return view('forum.index', compact('forum'));
    }
}
