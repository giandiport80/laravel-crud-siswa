<?php

namespace App\Http\Controllers;

use App\Forum;
use Illuminate\Http\Request;

class ForumController extends Controller
{
    public function index()
    {
        $forum = Forum::orderBy('created_at')->paginate(10);

        return view('forum.index', compact('forum'));
    }

    public function store(Request $request)
    {
        $request->request->add(['user_id' => auth()->user()->id]); // .. 1

        Forum::create($request->all());

        return redirect()->back()->with('sukses', 'Forum berhasil ditambahkan!');
    }

    public function show(Forum $forum)
    {
        return view('forum.show', compact('forum'));
    }
}










// h: DOKUMENTASI
// p: clue 1
// kita bisa menambahkan request dengan method requet->add()
// dalam hal ini kita tambah user_id nya

