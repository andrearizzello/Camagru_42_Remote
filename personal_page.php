<?php
session_start();
if (!isset($_SESSION['user']))
    header("Location: index.php");
//print_r($_SESSION['user'])
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <title>Camagru - Personal Zone</title>
    <link href="https://fonts.googleapis.com/css?family=Pacifico|Roboto:300" rel="stylesheet">
    <link rel="stylesheet" href="css/body.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="icon" type="image/png" sizes="32x32" href="imgs/favicon.png">
    <script src="js/functions.js"></script>
    <script>
        window.onload = function () {
            getCamera();
        };
    </script>
</head>
<body>
<header style="text-align: center">
    <h1 style="font-family: 'Roboto', sans-serif; font-size: 300%">Your personal zone</h1>
    <button id="first" class="btn-red-index delay" style="position: absolute; float: unset" onclick="destroy_session()"><span class="fix-skew">Logout</span></button>
</header>
<div class="flex-container">
    <div class="superpos-container">
<!--        TODO: Addare il disable se non si trova la cam-->
        <div style="display: block">
            <img src="imgs/hat.png"><br>
            <label for="pic-hat">Hat</label>
            <input id="pic-hat" name="mask" type="radio" value="1" onchange="trigger(this)">
        </div>
        <div style="display: block">
            <img src="imgs/sunglasses.png"><br>
            <label for="pic-glasses">Sunglasses</label>
            <input id="pic-glasses" name="mask" type="radio" value="2" onchange="trigger(this)">
        </div>
        <div style="display: block">
            <img src="imgs/pipe.png"><br>
            <label for="pic-pipe">Pipe</label>
            <input id="pic-pipe" name="mask" type="radio" value="3" onchange="trigger(this)">
        </div>
    </div>
    <div id="camera-container" class="camera-container">
        <video id="camera" autoplay></video>
        <img id="camera-icon" src="imgs/photo-camera.svg" onclick="takePicture()">
        <img id="superpos" src="" class="selected">
    </div>
    <div id="prev-cont" class="preview-container">
    </div>
</div>
<footer>
    <p>Andrea Rizzello (@arizzell) 2018</p>
</footer>
</body>
</html>