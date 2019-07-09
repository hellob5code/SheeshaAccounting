<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">

    <title>JCORE - <?php echo $title; ?></title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-cdjp-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="description" content="Avenxo Admin Theme">
    <meta name="author" content="">

    <?php echo $_def_css_files; ?>

    <link rel="stylesheet" href="assets/plugins/spinner/dist/ladda-themeless.min.css">
    <link type="text/css" href="assets/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/datatables/dataTables.themify.css" rel="stylesheet">
    <link href="assets/plugins/select2/select2.min.css" rel="stylesheet">
    <!--<link href="assets/dropdown-enhance/dist/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">-->
    <link href="assets/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link type="text/css" href="assets/plugins/iCheck/skins/minimal/blue.css" rel="stylesheet">              <!-- iCheck -->
    <link type="text/css" href="assets/plugins/iCheck/skins/minimal/_all.css" rel="stylesheet">                   <!-- Custom Checkboxes / iCheck -->

    <style>
        .toolbar{
            float: left;
        }
/*
        #tbl_entries td,#tbl_entries tr,#tbl_entries th{
            table-layout: fixed;
            border: 1px solid gray;
            border-collapse: collapse;
        }*/

        body {
            overflow-x: hidden;
        }
        .right-align{
            text-align: right;
        }
        #tbl_inventory td:nth-child(6){
            text-align: right;
        }

        td.details-control {
            background: url('assets/img/Folder_Closed.png') no-repeat center center;
            cursor: pointer;
        }
        tr.details td.details-control {
            background: url('assets/img/Folder_Opened.png') no-repeat center center;
        }


        .child_table{
            padding: 5px;
            border: 1px #ff0000 solid;
        }

        .glyphicon.spinning {
            animation: spin 1s infinite linear;
            -webkit-animation: spin2 1s infinite linear;
        }
        .select2-container{
            min-width: 100%;
            z-index: 999999999;
        }
        @keyframes spin {
            from { transform: scale(1) rotate(0deg); }
            to { transform: scale(1) rotate(360deg); }
        }

        @-webkit-keyframes spin2 {
            from { -webkit-transform: rotate(0deg); }
            to { -webkit-transform: rotate(360deg); }
        }


        .custom_frame{

            border: 1px solid lightgray;
            margin: 1% 1% 1% 1%;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .numeric{
            text-align: right;
        }

        .boldlabel {
            font-weight: bold;
        }

        .modal-body {
            padding-left:0px !important;
        }

        .form-group {
            padding:0;
            margin:5px;
        }

        .input-group {
            padding:0;
            margin:0;
        }

        textarea {
            resize: none;
        }

        .modal-body p {
            margin-left: 20px !important;
        }

        #img_user {
            padding-bottom: 15px;
        }
        .hidden{
            display: none;
        }
    </style>

</head>

<body class="animated-content" style="font-family: tahoma;">

<?php echo $_top_navigation; ?>

<div id="wrapper">
    <div id="layout-static">

        <?php echo $_side_bar_navigation;?>

        <div class="static-content-wrapper white-bg">
            <div class="static-content"  >

                <div class="page-content"><!-- #page-content -->

                    <ol class="breadcrumb" style="margin-bottom: 0px;">
                        <li><a href="dashboard">Dashboard</a></li>
                        <li><a href="Inventory_report">Inventory Report</a></li>
                    </ol>

                    <div class="container-fluid">
                        <div data-widget-group="group1">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="div_payable_list">
                                        <div class="panel-group panel-default" id="accordionA">
                                            <div class="panel panel-default" style="border-radius: 0px;">
                                                <div id="collapseTwo" class="collapse in">
                                                    <div class="panel-body">
                                                    <h2 class="h2-panel-heading">Inventory Report</h2><hr>

                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    Brands * : <br />
                                                                    <select name="brand_id" id="cbo_brand" >
                                                                        <option value="0">All Brands</option>
                                                                        <?php foreach($brands as $brand) { ?>
                                                                            <option value="<?php echo $brand->brand_id; ?>"><?php echo $brand->brand_name; ?></option>
                                                                        <?php } ?>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    Categories * : <br />
                                                                    <select id="cbo_categories" class="form-control">
                                                                        <option value="0">All Categories</option>
                                                                        <?php foreach($categories as $category){ ?>
                                                                            <option value="<?php echo $category->category_id; ?>"><?php echo $category->category_name; ?></option>
                                                                        <?php } ?>
                                                                    </select>
                                                                </div>
                                                                <div class="col-lg-3">
                                                                    Sorting * : <br />
                                                                    <select id="cbo_sort" class="form-control">
                                                                        <option value="0">Products Alphabetically</option>
                                                                        <option value="1">Brand</option>
                                                                        <option value="2">Category</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-3">
                                                                    Department * : <br />
                                                                    <select id="cbo_department" class="form-control">
                                                                        <option value="0">All Department</option>
                                                                        <?php foreach($departments as $department){ ?>
                                                                            <option value="<?php echo $department->department_id; ?>"><?php echo $department->department_name; ?></option>
                                                                        <?php } ?>
                                                                    </select>

                                                                </div>
                                                                <div class="col-lg-3">
                                                                    Supplier * : <br />
                                                                    <select id="cbo_supplier" class="form-control">
                                                                        <option value="0">All Suppliers</option>
                                                                        <?php foreach($suppliers as $supplier){ ?>
                                                                            <option value="<?php echo $supplier->supplier_id; ?>"><?php echo $supplier->supplier_name; ?></option>
                                                                        <?php } ?>
                                                                    </select>

                                                                </div>

                                                                <div class="col-lg-2">
                                                                    As of Date * :<br />
                                                                    <div class="input-group">
                                                                        <input type="text" id="txt_date" name="date_txn" class="date-picker form-control" value="<?php echo date("m/d/Y"); ?>">
                                                                         <span class="input-group-addon">
                                                                                <i class="fa fa-calendar"></i>
                                                                         </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <button class="btn btn-primary" id="btn_print" title="Print" ><i class="fa fa-print"></i> Print Report</button>&nbsp;
                                                            <button class="btn btn-success" id="btn_export" title="Export" ><i class="fa fa-file-excel-o"></i> Export</button>
                                                            <button class="btn btn-primary <?php echo (in_array('7-2',$this->session->user_rights)?'':'hidden'); ?>" id="btn_print_detailed"  title="Print" ><i class="fa fa-print"></i> Print Detailed</button>
                                                            <button class="btn btn-success <?php echo (in_array('7-2',$this->session->user_rights)?'':'hidden'); ?>" id="btn_export_detailed"  title="Export" ><i class="fa fa-file-excel-o"></i> Export Detailed</button>
                                                        <br /><br>
                                                        <div id="tbl_inventory">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- .container-fluid -->
            </div> <!-- #page-content -->
        </div>

        <footer role="contentinfo">
            <div class="clearfix">
                <ul class="list-unstyled list-inline pull-left">
                    <li><h6 style="margin: 0;">&copy; 2016 - Paul Christian Rueda</h6></li>
                </ul>
                <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="ti ti-arrow-up"></i></button>
            </div>
        </footer>

    </div>
</div>
</div>








<?php echo $_switcher_settings; ?>
<?php echo $_def_js_files; ?>
<script type="text/javascript" src="assets/plugins/datatables/jquery.dataTables.js"></script>
<script type="text/javascript" src="assets/plugins/datatables/dataTables.bootstrap.js"></script>
<!-- Select2-->
<script src="assets/plugins/select2/select2.full.min.js"></script>
<!---<script src="assets/plugins/dropdown-enhance/dist/js/bootstrap-select.min.js"></script>-->
<!-- Date range use moment.js same as full calendar plugin -->
<script src="assets/plugins/fullcalendar/moment.min.js"></script>
<!-- Data picker -->
<script src="assets/plugins/datapicker/bootstrap-datepicker.js"></script>
<!-- numeric formatter -->
<script src="assets/plugins/formatter/autoNumeric.js" type="text/javascript"></script>
<script src="assets/plugins/formatter/accounting.js" type="text/javascript"></script>

<script>
    $(document).ready(function(){
        var dt; var _cboDepartment; var _cboCategories; var _cboBrands; var _cboSuppliers;  var _cboSort; 

        var initializeControls=function(){

            $('.date-picker').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: true,
                autoclose: true
            });
            _cboDepartment=$("#cbo_department").select2({ placeholder: "Choose Department", allowClear: false });
            _cboCategories=$("#cbo_categories").select2({placeholder: "Choose Category",allowClear: false});
            _cboBrands=$("#cbo_brand").select2({placeholder: "Choose Brand",allowClear: false});
            _cboSuppliers=$("#cbo_supplier").select2({placeholder: "Choose Supplier",allowClear: false});
            _cboSort=$("#cbo_sort").select2({placeholder: "Choose Sorting", allowClear: false});
            reloadList();
        }();

        var bindEventControls=function(){

            $('#cbo_brand,#cbo_categories,#cbo_department,#cbo_brand,#txt_date,#cbo_sort,#cbo_supplier').on('change',function(){
                reloadList();
            });

            $(document).on('click','#btn_print',function(){
                window.open('Inventory_report/transaction/preview-inventory?depid='+$('#cbo_department').val()+'&date='+$('#txt_date').val()+'&supid='+$('#cbo_supplier').val()+'&catid='+$('#cbo_categories').val()+'&bid='+$('#cbo_brand').val()+'&sortid='+$('#cbo_sort').val());
            });

            $(document).on('click','#btn_print_detailed',function(){
                window.open('Inventory_report/transaction/preview-inventory-with-total?depid='+$('#cbo_department').val()+'&date='+$('#txt_date').val()+'&supid='+$('#cbo_supplier').val()+'&catid='+$('#cbo_categories').val()+'&bid='+$('#cbo_brand').val()+'&sortid='+$('#cbo_sort').val());
            });

            $(document).on('click','#btn_export',function(){
                window.open('Inventory_report/transaction/export-inventory?depid='+$('#cbo_department').val()+'&date='+$('#txt_date').val()+'&supid='+$('#cbo_supplier').val()+'&catid='+$('#cbo_categories').val()+'&bid='+$('#cbo_brand').val()+'&sortid='+$('#cbo_sort').val());
            });

            $(document).on('click','#btn_export_detailed',function(){
                window.open('Inventory_report/transaction/export-inventory-with-total?depid='+$('#cbo_department').val()+'&date='+$('#txt_date').val()+'&supid='+$('#cbo_supplier').val()+'&catid='+$('#cbo_categories').val()+'&bid='+$('#cbo_brand').val()+'&sortid='+$('#cbo_sort').val());
            });

        }();


        var showSpinningProgress=function(e){
            $(e).toggleClass('disabled');
            $(e).find('span').toggleClass('glyphicon glyphicon-refresh spinning');
        };


        var showNotification=function(obj){
            PNotify.removeAll(); //remove all notifications
            new PNotify({
                title:  obj.title,
                text:  obj.msg,
                type:  obj.stat
            });
        };



        function reloadList(){
        $('#tbl_inventory').html('<tr><td align="center" colspan="8"><br /><img src="assets/img/loader/ajax-loader-sm.gif" /><br /><br /></td></tr>');
            var data = [];
             data.push({name : "date" ,value : $('#txt_date').val()});
             data.push({name : "depid" ,value : $('#cbo_department').val()});
             data.push({name : "catid" ,value : $('#cbo_categories').val()});
             data.push({name : "supid" ,value : $('#cbo_supplier').val()});
             data.push({name : "bid" ,value : $('#cbo_brand').val()});
             data.push({name : "sortid" ,value : $('#cbo_sort').val()});

            $.ajax({
                url : 'Inventory_report/transaction/get-inventory',
                type : "GET",
                cache : false,
                dataType : 'json',
                "data":data,
                success : function(response){
                $('#tbl_inventory').html('');

                if(_cboSort.val() == 0){ // ALPHABETICALLY
                    if(response.brands.length == 0){ $('#tbl_inventory').append('<h5>No Results Found</h5>');}else{
                        $('#tbl_inventory').append(
                            '<table style="width:100%" class="table table-striped" id="tbl_entries">'+
                            '<thead>'+
                            '<th>Product Code</th>'+
                            '<th>Product Description</th>'+
                            '<th>Category</th>'+
                            '<th>Unit</th>'+
                            '<th class="right-align">Quantity</th>'+                    
                            '</thead>'+
                                '<tbody id="">'+
                                '</tbody>'+
                            '</table>'
                        );

                         $.each(response.products, function(index,value){
                             $('#tbl_entries > tbody').append(
                                '<tr>'+
                                '<td>'+value.product_code+'</td>'+
                                '<td>'+value.product_desc+'</td>'+
                                '<td>'+value.category_name+'</td>'+
                                '<td>'+value.parent_unit_name+'</td>'+
                                '<td class="right-align">'+accounting.formatNumber(value.CurrentQty,2)+'</td>'+
                                '</tr>'
                            );
                         });    
                    }
                }

                if(_cboSort.val() == 1){ // BRAND THEN CATEGORY
                    if(response.brands.length == 0){ $('#tbl_inventory').append('<h5>No Results Found</h5>');}
                    $.each(response.brands, function(index,value){
                        $('#tbl_inventory').append(
                            '<h4>'+value.brand_name+'</h4>'+
                            '<table style="width:100%" class="table table-striped" id="tbl_entries'+value.brand_id+'">'+
                            '<thead>'+
                            '<th>Product Code</th>'+
                            '<th>Product Description</th>'+
                            '<th>Category</th>'+
                            '<th>Unit</th>'+
                            '<th class="right-align">Quantity</th>'+                    
                            '</thead>'+
                                '<tbody id="">'+
                                '</tbody>'+
                            '</table>'
                        );
                    });
                     $.each(response.products, function(index,value){
                         $('#tbl_entries'+value.brand_id+' > tbody').append(
                            '<tr>'+
                            '<td>'+value.product_code+'</td>'+
                            '<td>'+value.product_desc+'</td>'+
                            '<td>'+value.category_name+'</td>'+
                            '<td>'+value.parent_unit_name+'</td>'+
                            '<td class="right-align">'+accounting.formatNumber(value.CurrentQty,2)+'</td>'+
                            '</tr>'
                        );
                     });
                } // END OF 1
                if(_cboSort.val() == 2){ // BRAND THEN CATEGORY
                    if(response.categories.length == 0){ $('#tbl_inventory').append('<h5>No Results Found</h5>');}
                    $.each(response.categories, function(index,value){
                        $('#tbl_inventory').append(
                            '<h4>'+value.category_name+'</h4>'+
                            '<table style="width:100%" class="table table-striped" id="tbl_entries'+value.category_id+'">'+
                            '<thead>'+
                            '<th>Product Code</th>'+
                            '<th>Product Description</th>'+
                            '<th>Brand</th>'+
                            '<th>Unit</th>'+
                            '<th class="right-align">Quantity</th>'+                    
                            '</thead>'+
                                '<tbody id="">'+
                                '</tbody>'+
                            '</table>'
                        );
                    });
                     $.each(response.products, function(index,value){
                         $('#tbl_entries'+value.category_id+' > tbody').append(
                            '<tr>'+
                            '<td>'+value.product_code+'</td>'+
                            '<td>'+value.product_desc+'</td>'+
                            '<td>'+value.brand_name+'</td>'+
                            '<td>'+value.parent_unit_name+'</td>'+
                            '<td class="right-align">'+accounting.formatNumber(value.CurrentQty,2)+'</td>'+
                            '</tr>'
                        );
                     });
                } // END OF 2

                } // END OF SUCCESS
            });


            }; // END OF FUNCTION



    });
</script>


</body>

</html>