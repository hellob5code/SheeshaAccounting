<?php

class Categories_model extends CORE_Model {
    protected  $table="categories";
    protected  $pk_id="category_id";

    function __construct() {
        parent::__construct();
    }

    function get_category_list($category_id=null){
        $sql="  SELECT
                  a.*
                FROM
                  categories as a
                WHERE
                    a.is_deleted=FALSE AND a.is_active=TRUE
                ".($category_id==null?"":" AND a.category_id=$category_id")."
            ";
        return $this->db->query($sql)->result();
    }

    function get_distinct_category($catid,$supid,$bid){
        $sql="  SELECT
                  distinct(products.category_id),categories.category_name
                FROM
                  products

                  LEFT JOIN categories ON categories.category_id = products.category_id
                WHERE
                 products.is_active = TRUE AND products.is_deleted = FALSE
                 AND products.item_type_id = 1
                 ".($catid==0?"":" AND products.category_id=$catid")."
                 ".($supid==0?"":" AND products.supplier_id=$supid")."
                 ".($bid==0?"":" AND products.brand_id=$bid")."
                 ORDER BY category_name ASC

            ";
        return $this->db->query($sql)->result();
    }

    function get_distinct_brand($catid,$supid,$bid){
        $sql="  SELECT
                  distinct(products.brand_id),brands.brand_name
                FROM
                  products

                  LEFT JOIN brands ON brands.brand_id = products.brand_id
                WHERE
                 products.is_active = TRUE AND products.is_deleted = FALSE
                 AND products.item_type_id = 1
                 ".($catid==0?"":" AND products.category_id=$catid")."
                 ".($supid==0?"":" AND products.supplier_id=$supid")."
                 ".($bid==0?"":" AND products.brand_id=$bid")."
                 ORDER BY brand_name ASC

            ";
        return $this->db->query($sql)->result();
    }
}
?>