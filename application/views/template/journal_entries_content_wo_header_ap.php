<!DOCTYPE html>
<html>
<head>
    <title>Accounts Payable Journal</title>
    <style type="text/css">
        body {
            font-family: 'Calibri',sans-serif;
            font-size: 12px;
        }

        .align-right {
            text-align: right;
        }

        .align-left {
            text-align: left;
        }

        .data {
            border-bottom: 1px solid #404040;
        }

        .align-center {
            text-align: center;
        }

        .report-header {
            font-weight: bolder;
        }

        hr {
            /*border-top: 3px solid #404040;*/
        }

        tr {
/*            border: none!important;*/
        }

        tr:nth-child(even){
/*            background: #414141 !important;
            border: none!important;*/
        }

/*        tr:hover {
            transition: .4s;
            background: #414141 !important;
            color: white;
        }

        tr:hover .btn {
            border-color: #494949!important;
            border-radius: 0!important;
            -webkit-box-shadow: 0px 0px 5px 1px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 0px 5px 1px rgba(0,0,0,0.75);
            box-shadow: 0px 0px 5px 1px rgba(0,0,0,0.75);
        }
        */
            table{
        border:none;
    }
    </style>
</head>
<body>
    <div class="">
    </div>
    <table width="100%" border="1" cellspacing="-1">
        <tr>
            <td style="padding: 4px;" colspan="3"><strong>TXN # :</strong> <?php echo $journal_info->txn_no; ?></td>
        </tr>
        <tr>
            <td width="50%" style="padding: 4px;"><strong>REFERENCE # :</strong> <?php echo $journal_info->ref_no; ?></td>
            <td width="50%" style="padding: 4px;" colspan="2"><strong>TXN DATE :</strong> <?php echo date_format(new DateTime($journal_info->date_txn),"m/d/Y"); ?></td>
        </tr>
        <tr>
            <td style="padding: 4px;"><strong>SUPPLIER :</strong> <?php echo $journal_info->supplier_name; ?></td>
            <td style="padding: 4px;" colspan="2"><strong>ADDRESS :</strong> <?php echo $journal_info->address; ?></td>
        </tr>
    </table><br>
    <table width="100%" style="border-collapse: collapse;border-spacing: 0;font-family: tahoma;" border="0" class="table table-striped">
            <thead>
            <tr>
                <td style="border: 1px solid black;text-align: center;padding: 6px;" colspan="5"><strong>ENTRIES</strong></td>
            </tr>
            <tr>
                <th width="10%" style="border: 1px solid black;text-align: left;padding: 6px;">ACCNT. #</th>
                <th width="30%" style="border: 1px solid black;text-align: left;padding: 6px;">ACCOUNT</th>
                <th width="30%" style="border: 1px solid black;text-align: right;padding: 6px;">MEMO</th>
                <th width="15%" style="border: 1px solid black;text-align: right;padding: 6px;">DEBIT</th>
                <th width="15%" style="border: 1px solid black;text-align: right;padding: 6px;">CREDIT</th>
            </tr>
            </thead>
            <tbody>
            <?php

            $dr_amount=0.00; $cr_amount=0.00;

            foreach($journal_accounts as $account){

                ?>
                <tr>
                    <td width="30%" style="border: 1px solid black;text-align: left;padding: 6px;"><?php echo $account->account_no; ?></td>
                    <td width="30%" style="border: 1px solid black;text-align: left;padding: 6px;"><?php echo $account->account_title; ?></td>
                    <td width="30%" style="border: 1px solid black;text-align: right;padding: 6px;"><?php echo $account->memo; ?></td>
                    <td width="15%" style="border: 1px solid black;text-align: right;padding: 6px;"><?php echo number_format($account->dr_amount,2); ?></td>
                    <td width="15%" style="border: 1px solid black;text-align: right;padding: 6px;"><?php echo number_format($account->cr_amount,2); ?></td>
                </tr>
                <?php

                $dr_amount+=$account->dr_amount;
                $cr_amount+=$account->cr_amount;

            }

            ?>

            </tbody>
                <tfoot>
                    <tr style="border: 1px solid black;">
                        <td colspan="5"></td>
                    </tr>
                    <tr style="border: 1px solid black;">
                        <td style="border: 1px solid black;text-align: left;padding: 6px;" colspan="2"><strong>Remarks :</strong></td>
                        <td style="border: 1px solid black;text-align: right;padding: 6px;" align="right"><strong>Total : </strong></td>
                        <td style="border: 1px solid black;text-align: right;padding: 6px;" align="right"><strong><?php echo number_format($dr_amount,2); ?></strong></td>
                        <td style="border: 1px solid black;text-align: right;padding: 6px;" align="right"><strong><?php echo number_format($cr_amount,2); ?></strong></td>
                    </tr>
                    <tr style="border: 1px solid black;">
                        <td colspan="2" style="border: 1px solid black;text-align: left;padding: 6px;"><?php echo $journal_info->remarks; ?> &nbsp;</td>
                        <td colspan="3" style="border: 1px solid black;text-align: left;padding: 6px;"></td>
                    </tr>
                </tfoot>    
        </table>
</body>
</html>




















