

<?php

function construct(){
    request_auth();
    load_model('index');
}
function indexAction(){

    $data['comments'] = get_list_comments();
    load_view('index',$data);
}

function deleteAction(){
    $id = $_GET['id_binhluan'];
    delete_comment($id);
    push_notification('success', ['Xoá danh mục sản phẩm thành công'],'header');
    header('Location: ?role=admin&mod=binhluan');

}