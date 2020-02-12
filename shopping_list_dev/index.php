<?php


error_reporting(E_ALL);
ini_set("display_errors", 1);
/* Connexion à une base MySQL avec l'invocation de pilote */
$dsn = 'mysql:dbname=shopping_list;host=127.0.0.1';
$user = 'root';
$password = '';

try {
    $dbh = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
}
if(isset($_POST['submit'])) {
//    var_dump($_POST);
    // Insertion à l'aide d'une requête préparée


    $req = $bdd->prepare('INSERT INTO users(first_name,last_Name,city,street,house_number,login,password) VALUES(?, ?, ?, ?)');

    $donnees = htmlspecialchars($_POST['submit']);

    $req->bindParam(1, $nom);
    $req->bindParam(2, $prenom);
    $req->bindParam(3, $email);
    $req->bindParam(4, $telephone);



    $req->execute();
}?>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <title>Document</title>
</head>
<body>
<form method="POST" class="form-horizontal" action="">
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" name="first_name" class="form-control"  placeholder="Entrez votre nom">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" name="lastName" class="form-control"  placeholder="Entrez votre prenom">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" name="city" class="form-control"  placeholder="Entrez votre ville de résidence">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" name="street" class="form-control"  placeholder="Entrez le nom de votre rue">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="number" name="house_number" class="form-control"  placeholder="Entrez le numero de maison">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" name="login" class="form-control"  placeholder="Entrez votre login">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <input type="text" name="password" class="form-control"  placeholder="Entrez votre mot de passe">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" name="submit" class="btn btn-default">Envoyer</button>
        </div>
    </div>
</form>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
