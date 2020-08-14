<?php

namespace App\Exports;

use App\Siswa;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class SiswaExport implements FromCollection, WithMapping, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Siswa::all();
    }

    public function map($siswa): array
    {
        return [
            $siswa->namaLengkap(),
            $siswa->jenis_kelamin,
            $siswa->agama,
            $siswa->average()
        ];
    }

    public function headings(): array
    {
        return [
            'Nama Lengkap',
            'Jenis Kelamin',
            'Agama',
            'Rata-rata Nilai'
        ];
    }
}
