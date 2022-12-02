
<?php
    function get_list_bills() {
        $result = db_fetch_array("SELECT * FROM `bills`");
        return $result;
    }
?>