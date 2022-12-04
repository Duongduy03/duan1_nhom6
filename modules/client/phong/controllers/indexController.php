

<?php
function construct(){
    load_model('index');
}
function indexAction(){
    // request_auth(false);
    load_view('index');
}