<?php

namespace App\Imports;

use App\Siswa;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;

class SiswaImport implements ToCollection
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        dd($collection);
        foreach ($collection as $key => $row) {
            if($key >= 2){ // key adalah index nya dari collection, data nya dimulai dari index ke 2
                // $tanggal_lahir = ($row[5] - 25569) * 86400;
                Siswa::create([
                    'nama_depan' => $row[1],
                    'user_id' => 12,
                    'nama_belakang' => 'Al',
                    'jenis_kelamin' => $row[2],
                    'agama' => $row[3],
                    'alamat' => $row[4],
                    // 'tgl_lahir' => gmdate('Y m d', $tanggal_lahir)
                ]);
            }
        }
    }
}

// kita pakai fitur collection, jadi nanti data2 yang ada di file excel kita akan diubah menjadi collection

// * hasil dari import excel, didalamnya ada 7 data
// Illuminate\Support\Collection {#1445 ▼
    //   #items: array:7 [▼
    //     0 => Illuminate\Support\Collection {#1449 ▶}
    //     1 => Illuminate\Support\Collection {#1446 ▶}
    //     2 => Illuminate\Support\Collection {#1431 ▶}
    //     3 => Illuminate\Support\Collection {#1429 ▶}
    //     4 => Illuminate\Support\Collection {#1424 ▶}
    //     5 => Illuminate\Support\Collection {#1421 ▶}
    //     6 => Illuminate\Support\Collection {#1394 ▶}
    //   ]
    // }
    
    // ? setiap baris dimulai dari index 0
    
    // * di dalamnya terdapat 6 item
//   #items: array:7 [▼
//     0 => Illuminate\Support\Collection {#1449 ▼
//       #items: array:6 [▶]
//     }

    // * yang isinya seprti ini 
// #items: array:6 [▼
// 0 => 1
// 1 => "Diah Wulansari"
// 2 => "P"
// 3 => "Islam"
// 4 => "Jl. Pemuda Tangerang"
// 5 => 36861