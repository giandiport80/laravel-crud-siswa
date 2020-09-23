<!-- Javascript -->
<script src="{{ asset('admin/assets/vendor/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('admin/assets/vendor/bootstrap/js/bootstrap.min.js') }}"></script>
<script src="{{ asset('admin/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js') }}"></script>
<script src="{{ asset('admin/assets/scripts/klorofil-common.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script>
    @if(Session::has('pesan'))
    toastr.success("{{ Session::get('pesan') }}", 'Sukses')
  @endif
</script>
@stack('scripts')


</body>

</html>