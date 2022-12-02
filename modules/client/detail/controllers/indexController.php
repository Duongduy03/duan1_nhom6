<?php


function construct() {
    // request_auth();
    load_model('index');
}
function indexAction(){
    load_view('index');
}

function detailAction(){
    $id = $_GET['id_room'];
    $data['room_detail']= get_one_room($id);
    load_view('index',$data);

}