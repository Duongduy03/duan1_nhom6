

<?php

function get_one_room($id){
    $result = db_fetch_row("SELECT * FROM `phong` where id = $id ");
    return $result;
}
function get_one_user($id){
    // $id = $_GET['id_user'];
    $result = db_fetch_row("SELECT * FROM `users` WHERE id ='$id'");
    return $result;
}
function get_list_loai_phong(){
    $result = db_fetch_array("SELECT * FROM `loaiphong`");
    return $result;
}