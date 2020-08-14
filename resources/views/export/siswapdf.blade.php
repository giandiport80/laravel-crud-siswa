{{-- untuk styling, gisarankan untuk inline css --}}
<table border="1">
  <thead>
    <tr>
      <th>Nama Lengkap</th>
      <th>Jenis Kelamin</th>
      <th>Agama</th>
      <th>Rata-rata nilai</th>
    </tr>
  </thead>
  <tbody>
    @foreach ($siswa as $sw)
    <tr>
      <td>{{ $sw->namaLengkap() }}</td>
      <td>{{ $sw->jenis_kelamin }}</td>
      <td>{{ $sw->agama }}</td>
      <td>{{ $sw->average() }}</td>
    </tr>
    @endforeach
  </tbody>
</table>