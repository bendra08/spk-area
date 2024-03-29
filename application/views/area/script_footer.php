<script>
var table;
$(document).ready(function() {
    $('.select2').select2();
    loadtable();
});

function loadtable() {
    //datatables
    table = $('#dtable').DataTable({
        'paging': true,
        'lengthChange': true,
        'searching': true,
        'ordering': true,
        'info': true,
        'autoWidth': true,
        'columns': [
            null,
            null,
            null,
            null,
            null,
            {
                'width': '50px'
            },
        ],
        'bDestroy': true,
        'processing': true, //Feature control the processing indicator.\
        'serverSide': true, //Feature control DataTables' server-side processing mode.\
        'order': [], //Initial no order.

        // Load data for the table's content from an Ajax source
        'ajax': {
            'url': "<?= site_url('area/ajax_list/') ?>",
            'type': "POST",
        },

        //Set column definition initialisation properties.
        'columnDefs': [{
            'targets': [0], //first column / numbering column
            'orderable': false, //set not orderable
        }, ],

    });
}


function hapusArea(param) {
    param = decodeURIComponent(param);
    param = JSON.parse(param);
    var id = param.id;
    var nama = param.nama;

    $('#kode_area').html(b64_to_utf8(id));
    $('#nama_area').html(nama);
    $('#btnHapus').attr('href', '/spk-area/user/area/hapus/' + id);
    $('#modal-hapus-area').modal();
}
function b64_to_utf8( str ) {
  return decodeURIComponent(escape(window.atob( str )));
}
</script>