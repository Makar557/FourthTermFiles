<?php

if(isset($_GET["door"]))
{
    $door = $_GET["door"];
    $status = $_GET["status"];

    echo ($door == "1" && $status == "open") ? "ok" : "error";

    return;
}
else if(isset($_POST["door"]))
{
    $door = $_POST["door"];
    $status = $_POST["status"];
    $code = $_POST["code"];

    echo ($door == "2" && $status == "open" && $code == "123") ? "ok" : "error";
    return;
}

echo "not valid";
?>