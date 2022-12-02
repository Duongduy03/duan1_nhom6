
<?php
function construct()
{
    request_auth();
    //    echo "DÙng chung, load đầu tiên";
    load_model('index');
}
function indexAction()
{
    $bills = get_list_bills();
    //    show_array($list_users);
    $data['bills'] = $bills;
    load_view('index', $data);
}
?>