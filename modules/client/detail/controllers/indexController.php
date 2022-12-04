<?php


function construct() {
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
function bookingAction(){
    $id = $_GET['id_room'];
    $data['list_loai_phong'] = get_list_loai_phong();
    $data['room_detail']= get_one_room($id);
   
    load_view('booking',$data);
}
function bookingPostAction(){
    $price = $_POST['price'];
    $loaiPhong = $_POST['loaiPhong'];
    $slPhong = $_POST['slPhong'];
    $ngayDat = $_POST['ngayDat'];
    $ngayTra = $_POST['ngayTra'];
    $_SESSION['booking'] = [];
    $array_booking = [$price, $loaiPhong, $slPhong, $ngayDat, $ngayTra];
    array_push($_SESSION['booking'],$array_booking);

    
}