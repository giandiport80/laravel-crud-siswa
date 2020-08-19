@component('mail::message')
# Pendaftaran Siswa

Selamat anda telah terdaftar di SMA NEGERI 11 KAB. TANGERANG

Silahkan tekan tombol ini untuk verifikasi email
@component('mail::button', ['url' => 'http://reactjs.org'])
Klik Disini!
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
