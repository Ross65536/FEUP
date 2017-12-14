<?php

include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/includes/init.php');
include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/database/user.php');
include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/database/todoList.php');
include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/templates/common/header.php');

if (isset($_SESSION['username']) && $_SESSION['username'] != '') {
    $tasks = getAllUserTasks($_SESSION['username']);
/*    $tdLists = getAllUserTDLists($_SESSION['username']);*/

    $tdLists = getAllTDLists();
    include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/templates/tdLists/list_tdLists.php');
    include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/templates/tasks/list_tasks.php');

}
else{
    include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/templates/pages/home.php');
}

include_once($_SERVER["DOCUMENT_ROOT"].'/FEUP-LTW/Project1/templates/common/footer.php');

?>
