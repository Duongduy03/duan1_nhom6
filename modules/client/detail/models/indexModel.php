

<?php

function get_one_room($id){
    $result = db_fetch_row("SELECT * FROM `phong` where id = $id ");
    return $result;
}