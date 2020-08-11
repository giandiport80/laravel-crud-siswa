<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login()
    {
        return view('auth.login');
    }

    public function authLogin(Request $request)
    {
        if(Auth::attempt($request->only('email', 'password'))){
            return redirect()->route('dashboard.index');
        }

        return view('auth.login');
    }

    public function authLogout()
    {
        Auth::logout();
        return redirect()->route('login');
    }
}
