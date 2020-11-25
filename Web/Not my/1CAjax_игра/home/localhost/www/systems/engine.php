<?php
session_start();

if(isset($_GET["method"]))
{
    $method = $_GET["method"];

    if($method == "getkey")
    {
        session_unset();

        $_SESSION['authkey'] = mt_rand(100000,999999)."";

        echo $_SESSION['authkey'];
        return;
    }
}
else if(isset($_POST["method"]))
{
    $method = $_POST["method"];
    $key = $_POST["key"];

    if($_SESSION['authkey'] && $_SESSION['authkey'] == $key && $method == "restart")
    {
        session_unset();

        echo "engine_restarted"; return;
    }
}

echo "error";
?>