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
    $data['comment'] = get_list_comment($id);
    
    load_view('index',$data);

}
function bookingAction(){
    $id = $_GET['id_room'];
    $data['list_loai_phong'] = get_list_loai_phong();
    $data['room_detail']= get_one_room($id);
    $data['bills'] = get_list_bill_id($id);
    load_view('booking',$data);
}
function bookingPostAction(){

    $id = $_GET['id_room'];
    $bills = get_list_bill_id($id);
    $id_user = $_POST['id_user'];
    $id_phong = $_POST['id_phong'];
    $price = $_POST['price'];
    $loaiPhong_id = $_POST['loaiPhong_id'];
    // $slPhong = $_POST['slPhong'];
    $ngayDat = $_POST['ngayDat'];
    $ngayTra = $_POST['ngayTra'];
    $_SESSION['booking'] = [];
    $array_booking = [$price, $loaiPhong_id, $ngayDat, $ngayTra,$id_user,$id_phong];
    array_push($_SESSION['booking'],$array_booking);
    
    if(empty($ngayDat) || empty($ngayTra)){
        push_notification('danger', ['Bạn vui lòng nhập đủ thông tin'],'header');
        header("Location: ?role=client&mod=detail&action=booking&id_room=$id");
    }else if(strtotime($ngayDat) > strtotime($ngayTra)){
        push_notification('danger', ['Ngày trả phải lớn hơn ngày đặt'],'header');
        header("Location: ?role=client&mod=detail&action=booking&id_room=$id");
    }
    else{
        create_bill($price, $loaiPhong_id, $ngayDat, $ngayTra,$id_user,$id_phong);
        push_notification('primary',['Đặt phòng thành công'],'header');
        header("Location: ?role=client&mod=detail&action=booking&id_room=$id");
        // var_export($count_user);

    }
    // show_array($_SESSION['booking']);
}

function detailPostAction(){
    $id = $_GET['id_room'];
    $so_sao = $_POST['rating'];
    $description = $_POST['comment'];
    $id_user = $_POST['id_user'];
    $id_phong = $_POST['id_phong'];
    if(empty($description) || empty($so_sao) ){
        // create_bill($price, $loaiPhong_id, $ngayDat, $ngayTra,$id_user,$id_phong);
        push_notification('primary',['Vui lòng điền đầy đủ thông tin'],'header');
        header("Location: ?role=client&mod=detail&action=detail&id_room=$id");
    }else{
        create_comment($so_sao,$description,$id_user,$id_phong);
        header("Location: ?role=client&mod=detail&action=detail&id_room=$id");
    }

}
