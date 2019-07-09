<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inventory_report extends CORE_Controller
{
    function __construct()
    {
        parent::__construct('');
        $this->validate_session();
        $this->load->model(
            array
            (
                'Departments_model',
                'Company_model',
                'Users_model',
                'Products_model',
                'Suppliers_model',
                'Categories_model',
                'Brands_model',
                'Account_integration_model'
            )
        );
        $this->load->library('excel');
        $this->load->model('Email_settings_model');
    }

    public function index() {
        $this->Users_model->validate();
        $data['_def_css_files'] = $this->load->view('template/assets/css_files', '', true);
        $data['_def_js_files'] = $this->load->view('template/assets/js_files', '', true);
        $data['_switcher_settings'] = $this->load->view('template/elements/switcher', '', true);
        $data['_side_bar_navigation'] = $this->load->view('template/elements/side_bar_navigation', '', true);
        $data['_top_navigation'] = $this->load->view('template/elements/top_navigation', '', true);
        $data['title'] = 'Inventory Report';

        $data['departments']=$this->Departments_model->get_list(array('is_deleted'=>FALSE,'is_active'=>TRUE));
        $data['suppliers']=$this->Suppliers_model->get_list(
            array('suppliers.is_deleted'=>FALSE),
            'suppliers.*,IFNULL(tax_types.tax_rate,0)as tax_rate',
            array(
                array('tax_types','tax_types.tax_type_id=suppliers.tax_type_id','left')
            ),
            'suppliers.supplier_name ASC'
        );
        $data['categories'] = $this->Categories_model->get_list(array('categories.is_deleted'=>FALSE),null,null,'category_name ASC');
        $data['brands']= $this->Brands_model->get_brand_list();

        (in_array('15-7',$this->session->user_rights)? 
        $this->load->view('inventory_report_v2',$data)
        :redirect(base_url('dashboard')));
    }



    public function transaction($txn=null){
        switch($txn){
            case 'get-inventory':
                $m_products = $this->Products_model;
                $date = date('Y-m-d',strtotime($this->input->get('date',TRUE)));
                $depid = $this->input->get('depid',TRUE);
                $catid = $this->input->get('catid',TRUE);
                $supid = $this->input->get('supid',TRUE);
                $bid = $this->input->get('bid',TRUE);
                $sortid = $this->input->get('sortid',TRUE);

                $account_integration =$this->Account_integration_model;
                $a_i=$account_integration->get_list();
                $account =$a_i[0]->sales_invoice_inventory;
                $account_cii =$a_i[0]->cash_invoice_inventory; // Cash Invoice 
                $account_dis =$a_i[0]->dispatching_invoice_inventory; // Dispatching Invoice 

                if($sortid == 0){
                    $sort = 'ORDER BY TRIM(core.product_desc) ASC';
                } else if ($sortid == 1){
                    $sort = 'ORDER BY brands.brand_name ASC, core.category_name ASC, TRIM(core.product_desc) ASC'; // Brand, then Category
                } else if ($sortid == 2){
                    $sort = 'ORDER BY core.category_name ASC, brands.brand_name ASC, TRIM(core.product_desc) ASC'; // Category, then Brand
                }else {
                    $sort = '';
                }

                $response['categories']= $this->Categories_model->get_distinct_category($catid,$supid,$bid);
                $response['brands']= $this->Categories_model->get_distinct_brand($catid,$supid,$bid);
                $response['products']=$m_products->product_list($account,$date,null,$supid,$catid,1,null,$depid,$account_cii,$account_dis,$bid,$sort);
                echo json_encode($response);
                break;

            case 'preview-inventory':
                $account_integration =$this->Account_integration_model;
                $a_i=$account_integration->get_list();
                $account =$a_i[0]->sales_invoice_inventory;
                $account_cii =$a_i[0]->cash_invoice_inventory;
                $account_dis =$a_i[0]->dispatching_invoice_inventory; // Dispatching Invoice 

                $m_products = $this->Products_model;
                $m_department = $this->Departments_model;

                $date = date('Y-m-d',strtotime($this->input->get('date',TRUE)));
                $depid = $this->input->get('depid',TRUE);
                $catid = $this->input->get('catid',TRUE);
                $supid = $this->input->get('supid',TRUE);
                $bid = $this->input->get('bid',TRUE);
                $sortid = $this->input->get('sortid',TRUE);



                if($sortid == 0){
                    $sort = 'ORDER BY TRIM(core.product_desc) ASC';
                } else if ($sortid == 1){
                    $sort = 'ORDER BY brands.brand_name ASC, core.category_name ASC, TRIM(core.product_desc) ASC'; // Brand, then Category
                } else if ($sortid == 2){
                    $sort = 'ORDER BY core.category_name ASC, brands.brand_name ASC, TRIM(core.product_desc) ASC'; // Category, then Brand
                }else {
                    $sort = '';
                }
                $info = $m_department->get_department_list($depid);
                $supinfo = $this->Suppliers_model->get_list($supid,'supplier_name');
                $catinfo = $this->Categories_model->get_list($catid,'category_name');
                $brinfo = $this->Brands_model->get_list($bid,'brand_name');

                $data['date'] = date('m/d/Y',strtotime($date));
                if(isset($info[0])){ $data['department'] =$info[0]->department_name; }else{ $data['department'] = 'All Departments';}
                if(isset($supinfo[0])){ $data['supplier'] =$supinfo[0]->supplier_name; }else{ $data['supplier'] = 'All Suppliers';}
                if(isset($catinfo[0])){ $data['category'] =$catinfo[0]->category_name; }else{ $data['category'] = 'All Categories';}
                if(isset($brinfo[0])){ $data['brand'] =$brinfo[0]->brand_name; }else{ $data['brand'] = 'All Brands';}

                $data['categories']= $this->Categories_model->get_distinct_category($catid,$supid,$bid);
                $data['brands']= $this->Categories_model->get_distinct_brand($catid,$supid,$bid);
                $data['products']=$m_products->product_list($account,$date,null,$supid,$catid,1,null,$depid,$account_cii,$account_dis,$bid,$sort);
                $data['company_info']=$this->Company_model->get_list()[0];
                $this->load->view('template/batch_inventory_report_v2',$data);
                break;

            case 'preview-inventory-with-total':
                $account_integration =$this->Account_integration_model;
                $a_i=$account_integration->get_list();
                $account =$a_i[0]->sales_invoice_inventory;
                $account_cii =$a_i[0]->cash_invoice_inventory;
                $account_dis =$a_i[0]->dispatching_invoice_inventory; // Dispatching Invoice 

                $m_products = $this->Products_model;
                $m_department = $this->Departments_model;

                $date = date('Y-m-d',strtotime($this->input->get('date',TRUE)));
                $depid = $this->input->get('depid',TRUE);
                $catid = $this->input->get('catid',TRUE);
                $supid = $this->input->get('supid',TRUE);
                $bid = $this->input->get('bid',TRUE);
                $sortid = $this->input->get('sortid',TRUE);

                if($sortid == 0){
                    $sort = 'ORDER BY TRIM(core.product_desc) ASC';
                } else if ($sortid == 1){
                    $sort = 'ORDER BY brands.brand_name ASC, core.category_name ASC, TRIM(core.product_desc) ASC'; // Brand, then Category
                } else if ($sortid == 2){
                    $sort = 'ORDER BY core.category_name ASC, brands.brand_name ASC, TRIM(core.product_desc) ASC'; // Category, then Brand
                }else {
                    $sort = '';
                }

                $info = $m_department->get_department_list($depid);
                $supinfo = $this->Suppliers_model->get_list($supid,'supplier_name');
                $catinfo = $this->Categories_model->get_list($catid,'category_name');
                $brinfo = $this->Brands_model->get_list($bid,'brand_name');

                $data['date'] = date('m/d/Y',strtotime($date));
                if(isset($info[0])){ $data['department'] =$info[0]->department_name; }else{ $data['department'] = 'All Departments';}
                if(isset($supinfo[0])){ $data['supplier'] =$supinfo[0]->supplier_name; }else{ $data['supplier'] = 'All Suppliers';}
                if(isset($catinfo[0])){ $data['category'] =$catinfo[0]->category_name; }else{ $data['category'] = 'All Categories';}
                if(isset($brinfo[0])){ $data['brand'] =$brinfo[0]->brand_name; }else{ $data['brand'] = 'All Brands';}

                $data['categories']= $this->Categories_model->get_distinct_category($catid,$supid,$bid);
                $data['brands']= $this->Categories_model->get_distinct_brand($catid,$supid,$bid);
                $data['products']=$m_products->product_list($account,$date,null,$supid,$catid,1,null,$depid,$account_cii,$account_dis,$bid,$sort);
                $data['company_info']=$this->Company_model->get_list()[0];

                $this->load->view('template/batch_inventory_report_v2_with_total',$data);
                break;

            case 'export-inventory':

                $excel = $this->excel;
                $account_integration =$this->Account_integration_model;
                $a_i=$account_integration->get_list();
                $account =$a_i[0]->sales_invoice_inventory;
                $ci_account =$a_i[0]->cash_invoice_inventory;
                $account_dis =$a_i[0]->dispatching_invoice_inventory; // Dispatching Invoice 
                $catid = $this->input->get('catid',TRUE);
                $supid = $this->input->get('supid',TRUE);
                $bid = $this->input->get('bid',TRUE);
                $sortid = $this->input->get('sortid',TRUE);



                if($sortid == 0){
                    $sort = 'ORDER BY TRIM(core.product_desc) ASC';
                } else if ($sortid == 1){
                    $sort = 'ORDER BY brands.brand_name ASC, core.category_name ASC, TRIM(core.product_desc) ASC'; // Brand, then Category
                } else if ($sortid == 2){
                    $sort = 'ORDER BY core.category_name ASC, brands.brand_name ASC, TRIM(core.product_desc) ASC'; // Category, then Brand
                }else {
                    $sort = '';
                }

                $m_products = $this->Products_model;
                $m_department = $this->Departments_model;

                $date = date('Y-m-d',strtotime($this->input->get('date',TRUE)));
                $depid = $this->input->get('depid',TRUE);
                $info = $m_department->get_department_list($depid);
                $supinfo = $this->Suppliers_model->get_list($supid,'supplier_name');
                $catinfo = $this->Categories_model->get_list($catid,'category_name');
                $brinfo = $this->Brands_model->get_list($bid,'brand_name');

               
                if(isset($info[0])){ $department =$info[0]->department_name; }else{ $department = 'All Departments';}
                if(isset($supinfo[0])){ $supplier =$supinfo[0]->supplier_name; }else{ $supplier = 'All Suppliers';}
                if(isset($catinfo[0])){ $category =$catinfo[0]->category_name; }else{ $category = 'All Categories';}
                if(isset($brinfo[0])){ $brand =$brinfo[0]->brand_name; }else{ $brand = 'All Brands';}

                $categories= $this->Categories_model->get_distinct_category($catid,$supid,$bid);
                $brands= $this->Categories_model->get_distinct_brand($catid,$supid,$bid);
                $products=$m_products->product_list($account,$date,null,$supid,$catid,1,null,$depid,$ci_account,$account_dis,$bid,$sort);
                 $date = date('m/d/Y',strtotime($date));

                $m_company_info=$this->Company_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];

                $excel->setActiveSheetIndex(0);

                $excel->getActiveSheet()->getColumnDimensionByColumn('A1:B1')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A2:C2')->setWidth('50');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A3')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A4')->setWidth('40');

                //name the worksheet
                $excel->getActiveSheet()->setTitle("Inventory Report");
                $excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->mergeCells('A1:B1');
                $excel->getActiveSheet()->mergeCells('A2:C2');
                $excel->getActiveSheet()->mergeCells('A3:B3');
                $excel->getActiveSheet()->mergeCells('A4:B4');

                $excel->getActiveSheet()->setCellValue('A1',$company_info[0]->company_name)
                                        ->setCellValue('A2',$company_info[0]->company_address)
                                        ->setCellValue('A3',$company_info[0]->landline.'/'.$company_info[0]->mobile_no)
                                        ->setCellValue('A4',$company_info[0]->email_address);

                $excel->getActiveSheet()->setCellValue('A6','Inventory Report - As of '.$date)
                                        ->getStyle('A6')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('A7','Category: '.$category)
                                        ->getStyle('A7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('B7','Brand: '.$brand)
                                        ->getStyle('B7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('C7','Department: '.$department)
                                        ->getStyle('C7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('D7','Supplier: '.$supplier)
                                        ->getStyle('D7')->getFont()->setItalic(TRUE);


                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('30');
    
                $excel->getActiveSheet()
                        ->getStyle('E9')
                        ->getAlignment()
                        ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

                 $style_header = array(

                    'fill' => array(
                        'type' => PHPExcel_Style_Fill::FILL_SOLID,
                        'color' => array('rgb'=>'CCFF99'),
                    ),
                    'font' => array(
                        'bold' => true,
                    )
                );

                 if($sortid == 0){
                    $excel->getActiveSheet()->getStyle('A9:E9')->applyFromArray( $style_header );
                    $excel->getActiveSheet()->getStyle('E9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->setCellValue('A9','PLU')->getStyle('A9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('B9','Description')->getStyle('B9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('C9','Category')->getStyle('C9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('D9','Unit')->getStyle('D9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('E9','Current Qty')->getStyle('E9')->getFont()->setBold(TRUE);

                    $i=10;

                    foreach($products as $product){
                            $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                            $excel->getActiveSheet()->getColumnDimension('B')->setWidth('50');
                            $excel->getActiveSheet()->getColumnDimension('C')->setWidth('40');
                            $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                            $excel->getActiveSheet()->getColumnDimension('E')->setWidth('35');

                
                            $excel->getActiveSheet()
                                    ->getStyle('A'.$i)
                                    ->getAlignment()
                                    ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                            $excel->getActiveSheet()->setCellValue('A'.$i,$product->product_code);
                            $excel->getActiveSheet()->setCellValue('B'.$i,$product->product_desc);
                            $excel->getActiveSheet()->setCellValue('C'.$i,$product->category_name);
                            $excel->getActiveSheet()->setCellValue('D'.$i,$product->parent_unit_name);

                            $excel->getActiveSheet()->getStyle('E'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                            $excel->getActiveSheet()->setCellValue('E'.$i,number_format($product->CurrentQty,2));
                            $i++;                  
                    }
                    if(count($products)==0){
                            $excel->getActiveSheet()->setCellValue('A'.$i,'No Records Found');
                    }
                 } // END OF SORT 0

                 if($sortid == 1){
                    $i = 9;
                    foreach ($brands as $brand) {

                    $excel->getActiveSheet()->getStyle('A'.$i.':E'.$i)->applyFromArray( $style_header );
                    $excel->getActiveSheet()->setCellValue('A'.$i,$brand->brand_name)->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $i++;
                    $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->setCellValue('A'.$i,'PLU')->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('B'.$i,'Description')->getStyle('B'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('C'.$i,'Category')->getStyle('C'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('D'.$i,'Unit')->getStyle('D'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('E'.$i,'Current Qty')->getStyle('E'.$i)->getFont()->setBold(TRUE);
                    $i++;
                        foreach($products as $product){
                            if($brand->brand_id == $product->brand_id){
                                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('50');
                                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('35');

                    
                                $excel->getActiveSheet()
                                        ->getStyle('A'.$i)
                                        ->getAlignment()
                                        ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                                $excel->getActiveSheet()->setCellValue('A'.$i,$product->product_code);
                                $excel->getActiveSheet()->setCellValue('B'.$i,$product->product_desc);
                                $excel->getActiveSheet()->setCellValue('C'.$i,$product->category_name);
                                $excel->getActiveSheet()->setCellValue('D'.$i,$product->parent_unit_name);

                                $excel->getActiveSheet()->getStyle('E'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('E'.$i,number_format($product->CurrentQty,2));
                                $i++; 
                            } //END OF IF 
                        } // END OF FOREACH PRODUCT
                        $i++;
                    } // END OF FOREACH BRAND


                    $i++;
                 } // END OF SORT 1


                 if($sortid == 2){
                    $i = 9;
                    foreach ($categories as $category) {
                    $excel->getActiveSheet()->getStyle('A'.$i.':E'.$i)->applyFromArray( $style_header );
                    $excel->getActiveSheet()->setCellValue('A'.$i,$category->category_name)->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $i++;
                    $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->setCellValue('A'.$i,'PLU')->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('B'.$i,'Description')->getStyle('B'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('C'.$i,'Brand')->getStyle('C'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('D'.$i,'Unit')->getStyle('D'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('E'.$i,'Current Qty')->getStyle('E'.$i)->getFont()->setBold(TRUE);
                    $i++;
                        foreach($products as $product){
                            if($category->category_id == $product->category_id){
                                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('50');
                                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('35');

                    
                                $excel->getActiveSheet()
                                        ->getStyle('A'.$i)
                                        ->getAlignment()
                                        ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                                $excel->getActiveSheet()->setCellValue('A'.$i,$product->product_code);
                                $excel->getActiveSheet()->setCellValue('B'.$i,$product->product_desc);
                                $excel->getActiveSheet()->setCellValue('C'.$i,$product->brand_name);
                                $excel->getActiveSheet()->setCellValue('D'.$i,$product->parent_unit_name);

                                $excel->getActiveSheet()->getStyle('E'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('E'.$i,number_format($product->CurrentQty,2));
                                $i++; 
                            } //END OF IF 
                        } // END OF FOREACH PRODUCT
                        $i++;
                    } // END OF FOREACH CATEGORY


                    $i++;
                 } // END OF SORT 2

                // $excel->getActiveSheet()->getStyle('A'.$i.':'.'E'.$i)->applyFromArray( $style_header );

                header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
                header('Content-Disposition: attachment;filename="Inventory Report '.date('M-d-Y',NOW()).'.xlsx"');
                header('Cache-Control: max-age=0');
                // If you're serving to IE 9, then the following may be needed
                header('Cache-Control: max-age=1');

                // If you're serving to IE over SSL, then the following may be needed
                header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
                header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
                header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
                header ('Pragma: public'); // HTTP/1.0

                $objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
                $objWriter->save('php://output');            
                     
            break;

            case 'export-inventory-with-total':

                $excel = $this->excel;
                $account_integration =$this->Account_integration_model;
                $a_i=$account_integration->get_list();
                $account =$a_i[0]->sales_invoice_inventory;
                $ci_account =$a_i[0]->cash_invoice_inventory;
                $account_dis =$a_i[0]->dispatching_invoice_inventory; // Dispatching Invoice 
                $catid = $this->input->get('catid',TRUE);
                $supid = $this->input->get('supid',TRUE);
                $bid = $this->input->get('bid',TRUE);
                $sortid = $this->input->get('sortid',TRUE);



                if($sortid == 0){
                    $sort = 'ORDER BY TRIM(core.product_desc) ASC';
                } else if ($sortid == 1){
                    $sort = 'ORDER BY brands.brand_name ASC, core.category_name ASC, TRIM(core.product_desc) ASC'; // Brand, then Category
                } else if ($sortid == 2){
                    $sort = 'ORDER BY core.category_name ASC, brands.brand_name ASC, TRIM(core.product_desc) ASC'; // Category, then Brand
                }else {
                    $sort = '';
                }

                $m_products = $this->Products_model;
                $m_department = $this->Departments_model;

                $date = date('Y-m-d',strtotime($this->input->get('date',TRUE)));
                $depid = $this->input->get('depid',TRUE);
                $info = $m_department->get_department_list($depid);
                $supinfo = $this->Suppliers_model->get_list($supid,'supplier_name');
                $catinfo = $this->Categories_model->get_list($catid,'category_name');
                $brinfo = $this->Brands_model->get_list($bid,'brand_name');

               
                if(isset($info[0])){ $department =$info[0]->department_name; }else{ $department = 'All Departments';}
                if(isset($supinfo[0])){ $supplier =$supinfo[0]->supplier_name; }else{ $supplier = 'All Suppliers';}
                if(isset($catinfo[0])){ $category =$catinfo[0]->category_name; }else{ $category = 'All Categories';}
                if(isset($brinfo[0])){ $brand =$brinfo[0]->brand_name; }else{ $brand = 'All Brands';}

                $categories= $this->Categories_model->get_distinct_category($catid,$supid,$bid);
                $brands= $this->Categories_model->get_distinct_brand($catid,$supid,$bid);
                $products=$m_products->product_list($account,$date,null,$supid,$catid,1,null,$depid,$ci_account,$account_dis,$bid,$sort);
                 $date = date('m/d/Y',strtotime($date));

                $m_company_info=$this->Company_model;
                $company_info=$m_company_info->get_list();
                $data['company_info']=$company_info[0];

                $excel->setActiveSheetIndex(0);

                $excel->getActiveSheet()->getColumnDimensionByColumn('A1:B1')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A2:C2')->setWidth('50');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A3')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimensionByColumn('A4')->setWidth('40');

                //name the worksheet
                $excel->getActiveSheet()->setTitle("Inventory Report");
                $excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->mergeCells('A1:B1');
                $excel->getActiveSheet()->mergeCells('A2:C2');
                $excel->getActiveSheet()->mergeCells('A3:B3');
                $excel->getActiveSheet()->mergeCells('A4:B4');

                $excel->getActiveSheet()->setCellValue('A1',$company_info[0]->company_name)
                                        ->setCellValue('A2',$company_info[0]->company_address)
                                        ->setCellValue('A3',$company_info[0]->landline.'/'.$company_info[0]->mobile_no)
                                        ->setCellValue('A4',$company_info[0]->email_address);

                $excel->getActiveSheet()->setCellValue('A6','Inventory Report - As of '.$date)
                                        ->getStyle('A6')->getFont()->setBold(TRUE);
                $excel->getActiveSheet()->setCellValue('A7','Category: '.$category)
                                        ->getStyle('A7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('B7','Brand: '.$brand)
                                        ->getStyle('B7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('C7','Department: '.$department)
                                        ->getStyle('C7')->getFont()->setItalic(TRUE);
                $excel->getActiveSheet()->setCellValue('D7','Supplier: '.$supplier)
                                        ->getStyle('D7')->getFont()->setItalic(TRUE);


                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimension('F')->setWidth('30');
                $excel->getActiveSheet()->getColumnDimension('G')->setWidth('30');
    
                $excel->getActiveSheet()
                        ->getStyle('E9')
                        ->getAlignment()
                        ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);

                 $style_header = array(

                    'fill' => array(
                        'type' => PHPExcel_Style_Fill::FILL_SOLID,
                        'color' => array('rgb'=>'CCFF99'),
                    ),
                    'font' => array(
                        'bold' => true,
                    )
                );

                 if($sortid == 0){
                    $excel->getActiveSheet()->getStyle('A9:G9')->applyFromArray( $style_header );
                    $excel->getActiveSheet()->getStyle('E9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->getStyle('F9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->getStyle('G9')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->setCellValue('A9','PLU')->getStyle('A9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('B9','Description')->getStyle('B9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('C9','Category')->getStyle('C9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('D9','Unit')->getStyle('D9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('E9','Current Qty')->getStyle('E9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('F9','Unit Cost')->getStyle('F9')->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('G9','Total')->getStyle('G9')->getFont()->setBold(TRUE);

                    $i=10;

                    foreach($products as $product){
                            $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                            $excel->getActiveSheet()->getColumnDimension('B')->setWidth('50');
                            $excel->getActiveSheet()->getColumnDimension('C')->setWidth('40');
                            $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                            $excel->getActiveSheet()->getColumnDimension('E')->setWidth('35');

                
                            $excel->getActiveSheet()
                                    ->getStyle('A'.$i)
                                    ->getAlignment()
                                    ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                            $excel->getActiveSheet()->setCellValue('A'.$i,$product->product_code);
                            $excel->getActiveSheet()->setCellValue('B'.$i,$product->product_desc);
                            $excel->getActiveSheet()->setCellValue('C'.$i,$product->category_name);
                            $excel->getActiveSheet()->setCellValue('D'.$i,$product->parent_unit_name);
                            $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                            $excel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                            $excel->getActiveSheet()->getStyle('G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                            $excel->getActiveSheet()->getStyle('E'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                            $excel->getActiveSheet()->setCellValue('E'.$i,number_format($product->CurrentQty,2));
                            $excel->getActiveSheet()->getStyle('F'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                            $excel->getActiveSheet()->setCellValue('F'.$i,number_format($product->purchase_cost,2));
                            $excel->getActiveSheet()->getStyle('G'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                            $excel->getActiveSheet()->setCellValue('G'.$i,number_format(($product->CurrentQty*$product->purchase_cost),2));
                            $i++;                  
                    }
                    if(count($products)==0){
                            $excel->getActiveSheet()->setCellValue('A'.$i,'No Records Found');
                    }
                 } // END OF SORT 0

                 if($sortid == 1){
                    $i = 9;
                    foreach ($brands as $brand) {

                    $excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray( $style_header );
                    $excel->getActiveSheet()->setCellValue('A'.$i,$brand->brand_name)->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $i++;

                    $excel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->getStyle('G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->setCellValue('A'.$i,'PLU')->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('B'.$i,'Description')->getStyle('B'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('C'.$i,'Category')->getStyle('C'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('D'.$i,'Unit')->getStyle('D'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('E'.$i,'Current Qty')->getStyle('E'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('F'.$i,'Unit Cost')->getStyle('F'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('G'.$i,'Total')->getStyle('G'.$i)->getFont()->setBold(TRUE);
                    $i++;
                        foreach($products as $product){
                            if($brand->brand_id == $product->brand_id){
                                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('50');
                                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('35');

                    
                                $excel->getActiveSheet()
                                        ->getStyle('A'.$i)
                                        ->getAlignment()
                                        ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                                $excel->getActiveSheet()->setCellValue('A'.$i,$product->product_code);
                                $excel->getActiveSheet()->setCellValue('B'.$i,$product->product_desc);
                                $excel->getActiveSheet()->setCellValue('C'.$i,$product->category_name);
                                $excel->getActiveSheet()->setCellValue('D'.$i,$product->parent_unit_name);

                                $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                                $excel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                                $excel->getActiveSheet()->getStyle('G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                                $excel->getActiveSheet()->getStyle('E'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('E'.$i,number_format($product->CurrentQty,2));
                                $excel->getActiveSheet()->getStyle('F'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('F'.$i,number_format($product->purchase_cost,2));
                                $excel->getActiveSheet()->getStyle('G'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('G'.$i,number_format(($product->CurrentQty*$product->purchase_cost),2));
                                $i++; 
                            } //END OF IF 
                        } // END OF FOREACH PRODUCT
                        $i++;
                    } // END OF FOREACH BRAND


                    $i++;
                 } // END OF SORT 1


                 if($sortid == 2){
                    $i = 9;
                    foreach ($categories as $category) {
                    $excel->getActiveSheet()->getStyle('A'.$i.':G'.$i)->applyFromArray( $style_header );
                    $excel->getActiveSheet()->setCellValue('A'.$i,$category->category_name)->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $i++;
                    $excel->getActiveSheet()->getStyle('G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                    $excel->getActiveSheet()->setCellValue('A'.$i,'PLU')->getStyle('A'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('B'.$i,'Description')->getStyle('B'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('C'.$i,'Brand')->getStyle('C'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('D'.$i,'Unit')->getStyle('D'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('E'.$i,'Current Qty')->getStyle('E'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('F'.$i,'Unit Cost')->getStyle('F'.$i)->getFont()->setBold(TRUE);
                    $excel->getActiveSheet()->setCellValue('G'.$i,'Total')->getStyle('G'.$i)->getFont()->setBold(TRUE);
                    $i++;
                        foreach($products as $product){
                            if($category->category_id == $product->category_id){
                                $excel->getActiveSheet()->getColumnDimension('A')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('B')->setWidth('50');
                                $excel->getActiveSheet()->getColumnDimension('C')->setWidth('40');
                                $excel->getActiveSheet()->getColumnDimension('D')->setWidth('25');
                                $excel->getActiveSheet()->getColumnDimension('E')->setWidth('35');

                    
                                $excel->getActiveSheet()
                                        ->getStyle('A'.$i)
                                        ->getAlignment()
                                        ->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_LEFT);

                                $excel->getActiveSheet()->setCellValue('A'.$i,$product->product_code);
                                $excel->getActiveSheet()->setCellValue('B'.$i,$product->product_desc);
                                $excel->getActiveSheet()->setCellValue('C'.$i,$product->brand_name);
                                $excel->getActiveSheet()->setCellValue('D'.$i,$product->parent_unit_name);

                                $excel->getActiveSheet()->getStyle('E'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                                $excel->getActiveSheet()->getStyle('F'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                                $excel->getActiveSheet()->getStyle('G'.$i)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
                                $excel->getActiveSheet()->getStyle('E'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('E'.$i,number_format($product->CurrentQty,2));
                                $excel->getActiveSheet()->getStyle('F'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('F'.$i,number_format($product->purchase_cost,2));
                                $excel->getActiveSheet()->getStyle('G'.$i)->getNumberFormat()->setFormatCode('###,##0.00;(###,##0.00)');                        
                                $excel->getActiveSheet()->setCellValue('G'.$i,number_format(($product->CurrentQty*$product->purchase_cost),2));
                                $i++; 
                            } //END OF IF 
                        } // END OF FOREACH PRODUCT
                        $i++;
                    } // END OF FOREACH CATEGORY


                    $i++;
                 } // END OF SORT 2

                header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
                header('Content-Disposition: attachment;filename="Inventory Report '.date('M-d-Y',NOW()).'.xlsx"');
                header('Cache-Control: max-age=0');
                // If you're serving to IE 9, then the following may be needed
                header('Cache-Control: max-age=1');

                // If you're serving to IE over SSL, then the following may be needed
                header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
                header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
                header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
                header ('Pragma: public'); // HTTP/1.0

                $objWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel2007');
                $objWriter->save('php://output');            
                     
            break;



        }
    }


}
?>