@extends('templates.main')

@section('content')

<div class="row">
	<div class="col-md-6">

		<div class="panel">
			<div class="panel-heading">
				<h3 class="panel-title">Ranking 3 Besar</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Ranking</th>
							<th>Nama</th>
							<th>Nilai Rata-rata</th>
						</tr>
					</thead>
					<tbody>
						@foreach (ranking3Besar() as $sw) {{-- helper yang kita buat --}}
						<tr>
							<td>{{ $loop->iteration }}</td>
							<td>{{ $sw->namaLengkap() }}</td>
							<td>{{ $sw->average }}</td>
						</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<div class="col-md-3">
		<div class="metric">
			<span class="icon"><i class="fa fa-user"></i></span>
			<p>
				<span class="number">{{ totalSiswa() }}</span>
				<span class="title">Total Siswa</span>
			</p>
		</div>
	</div>
	<div class="col-md-3">
		<div class="metric">
			<span class="icon"><i class="fa fa-user"></i></span>
			<p>
				<span class="number">{{ totalGuru() }}</span>
				<span class="title">Total Guru</span>
			</p>
		</div>
	</div>
</div>

@endsection