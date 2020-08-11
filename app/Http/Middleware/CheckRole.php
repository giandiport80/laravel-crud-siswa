<?php

namespace App\Http\Middleware;

use Closure;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, ...$roles)
    {
        if(in_array($request->user()->role, $roles)){
            return $next($request);
        }

        return redirect('/');
    }
}

// * ...roles
// seperti rest parameter yang bisa menampung banyak data berupa array


// ? setelah middleware dibuat, kita harus mendaftarkannya di kernel.php pada bagian protected $routeMiddleware


// * penjelasan
// if ($request->user()->role == $role) {
//     return $next($request);
// }

// return redirect('/');

// ? jika request dari user rolenya == role yang kita kirim dari parameter pada route, dalam hal ini admin, maka lanjutkan requestnya
// ! jika tidak, akan di redirect

