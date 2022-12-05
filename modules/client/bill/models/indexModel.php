<?php
function get_bill_id_user($id_user){
    $result = db_fetch_array("SELECT * FROM `bill` where id_user = $id_user");
    return $result;
}
function create_bill($price, $loaiPhong_id, $ngayDat, $ngayTra,$id_user,$id_phong) {
    $user = get_auth();
    $date_diff= abs(strtotime($ngayTra)-strtotime($ngayDat));
    $date_diff2 = floor($date_diff /(86400));
    // show_array($date_diff2);
    $all_price = $price*$date_diff2;
    $id = db_insert('bills', [
        
        'price' => $price,
        'loaiPhong_id'=> $loaiPhong_id,
        'ngay_thue' => $ngayDat,
        'ngay_tra' => $ngayTra,
        'id_user' => $id_user,
        'id_phong' => $id_phong,
        'create_at' => date('Y-m-d H:i:s'),
        'tong_tien' => $all_price,
    ]);
    return $id;
}