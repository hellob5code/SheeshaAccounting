<html>
<head>
    <title>Inventory Report</title>
    <style>
        body{
            font-family: 'Segoe UI',sans-serif;
            font-size: 12px;
        }
        table{
            font-size: 11;
            font-family: tahoma;
        }
        table thead th {
            text-align: left;
            border-bottom: 1px solid gray;
        }
        td{
            padding-left: 5px;
            padding-right: 3px;
            height: 20px;
        }
        .right-align{
            text-align: right;
        }
    </style>

    <script type="text/javascript">
        (function(){
            window.print();
        })();
    </script>
</head>
<body>
<div style="">
    <table width="100%" border="0">
        <tr>
            <td width="10%"><img src="<?php echo base_url().$company_info->logo_path; ?>" style="height: 90px; width: 120px; text-align: left;"></td>
            <td width="90%" class="">
                <span style="font-size: 20px;" class="report-header"><strong><?php echo $company_info->company_name; ?></strong></span><br>
                <span><?php echo $company_info->company_address; ?></span><br>
                <span><?php echo $company_info->landline.'/'.$company_info->mobile_no; ?></span><br>
                <span><?php echo $company_info->email_address; ?></span>
            </td>
        </tr>
    </table><hr>

    <h3 style="margin-bottom: 0px;">Inventory Report - <i>As of <?php echo $date; ?></i></h3>
    <table width="100%">
        <tbody>
            <tr>
                <td width="10%"><b>Category:</b></td>
                <td><?php echo $category; ?></td>
                <td width="10%"><b>Department:</b></td>
                <td><?php echo $department; ?></td>
            </tr>
            <tr>
                <td><b>Supplier:</b></td>
                <td><?php echo $supplier; ?></td>
                <td><b>Brand:</b></td>
                <td><?php echo $brand; ?></td>
            </tr>
        </tbody>
    </table>

    <?php if($_GET['sortid'] == 0) {  // ALPHABETICALLY?>
        <table style="width: 100%;border: 1px solid gray;" cellspacing="0" cellpadding="3">
            <thead>
                <th>Product Code</th>
                <th>Product Description</th>
                <th>Category</th>
                <th>Unit</th>
                <th style="text-align: right;">Quantity</th>
            </thead>
            <tbody id="">
            <?php foreach ($products as $product) { ?>
                <tr>
                    <td><?php echo $product->product_code; ?></td>
                    <td><?php echo $product->product_desc; ?></td>
                    <td><?php echo $product->category_name; ?></td>
                    <td><?php echo $product->parent_unit_name; ?></td>
                    <td class="right-align"><?php echo number_format($product->CurrentQty,2); ?></td>
                </tr>
            <?php } ?>
            </tbody>
        </table>
    <?php } // END OF SORT 0 ?> 
    <?php if($_GET['sortid'] == 1) {  // GROUP BY BRAND ?>
        <?php  foreach ($brands as $brand) { ?>
        <h3> <?php echo $brand->brand_name; ?></h3>
        <table style="width: 100%;border: 1px solid gray;" cellspacing="0" cellpadding="3">
            <thead>
                <th>Product Code</th>
                <th>Product Description</th>
                <th>Category</th>
                <th>Unit</th>
                <th style="text-align: right;">Quantity</th>
            </thead>
            <tbody id="">
            <?php foreach ($products as $product) {  if($brand->brand_id == $product->brand_id) {?>
                <tr>
                    <td><?php echo $product->product_code; ?></td>
                    <td><?php echo $product->product_desc; ?></td>
                    <td><?php echo $product->category_name; ?></td>
                    <td><?php echo $product->parent_unit_name; ?></td>
                    <td class="right-align"><?php echo number_format($product->CurrentQty,2); ?></td>
                </tr>
            <?php } }  // END OF FOREACH PRODUCT?>
            </tbody>
        </table>
    <?php 
        } // END OF FOREACH BRAND
    } // END OF SORT 1 ?> 
    <?php if($_GET['sortid'] == 2) {  // GROUP BY CATEGORY?>
        <?php  foreach ($categories as $category) { ?>
        <h3> <?php echo $category->category_name; ?></h3>
        <table style="width: 100%;border: 1px solid gray;" cellspacing="0" cellpadding="3">
            <thead>
                <th>Product Code</th>
                <th>Product Description</th>
                <th>Brand</th>
                <th>Unit</th>
                <th style="text-align: right;">Quantity</th>
            </thead>
            <tbody id="">
            <?php foreach ($products as $product) {  if($category->category_id == $product->category_id) {?>
                <tr>
                    <td><?php echo $product->product_code; ?></td>
                    <td><?php echo $product->product_desc; ?></td>
                    <td><?php echo $product->brand_name; ?></td>
                    <td><?php echo $product->parent_unit_name; ?></td>
                    <td class="right-align"><?php echo number_format($product->CurrentQty,2); ?></td>
                </tr>
            <?php } }  // END OF FOREACH PRODUCT?>
            </tbody>
        </table>
    <?php 
        } // END OF FOREACH BRAND
    } // END OF SORT 1 ?> 


</div>




</body>
</html>