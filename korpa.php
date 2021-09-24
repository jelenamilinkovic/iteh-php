<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="korpa.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
    <title>Document</title>
</head>
<body>
<?php include "konekcija/db.php";
include "klase/hrana.php";
//session_start();



for($i=0;$i<count($_SESSION['korpa']);$i++){
    if($_SESSION['korpa'][$i] == null) {
     $niz=$_SESSION['korpa'];
     array_splice($niz,$i, 1);
     $_SESSION['korpa']=$niz;
    }
}


echo "<h2 style='display: inline-block;'>Shopping Cart</h2>";
echo "<a style='margin-left:20px; font-size: 20px; display: inline-block;' href='http://localhost/restoran-master/index.html'><i class='fa fa-arrow-left'></i></a>";

for($i=0;$i<count($_SESSION['korpa']);$i++){

      $object = unserialize(serialize($_SESSION['korpa'][$i]));
        
        $naziv=$object->getNaziv();
        $opis=$object->getOpis();
        $slika = $object->getSlika();
        $cena=$object->getCena();
       
   
            echo  "<div class='col-md-6'><div class='row menu-list' style='margin-bottom: 10px;'>
                <div class='col-md-4'>
                    <img style='height: 100%;'class='img-responsive' src='{$slika}'>
                </div>
                <div class='col-md-8'>
                    <h4>{$naziv}</h4>
                    <p style= font-style: italic;'>{$opis}</p>
                    <p style= font-style: italic;'>{$cena}</p> <button class='obrisi' id={$i}>delete</button>";

                echo "</div>   
            </div>
        </div> ";
    echo "<hr>";
}
    echo " <input id='ime' type='text' name='ime' placeholder='ime' style='margin-top: 50px;'>";
    echo " <input id='prezime' type='text' name='prezime' placeholder='prezime'>";
    echo " <input id='adresa' type='text' name='adresa' placeholder='adresa'>";

    echo " <button style='margin-top: 40px;' class='checkout hrana'>Naruci</button>";
    echo "</div>";
   
?>


</body>

<script>
    $(".hrana").on('click', function(){
            console.log('kliknuto');
            let ime=document.getElementById("ime").value;
            let prezime=document.getElementById("prezime").value;
            let adresa=document.getElementById("adresa").value;
                $.ajax({
                    url:'operacije/dodaj_narudzbinu.php',
                    type:'POST',
                    data:{ime:ime, prezime:prezime, adresa:adresa},
                    success:function(){
                        location.replace('http://localhost/restoran-master/index.html')
                }
                });
            }); 
            $(".obrisi").on('click', function(){
            let id=this.id;
            console.log(id);
                $.ajax({
                    url:'operacije/obrisi_iz_korpe.php',
                    type:'GET',
                    data:{id:id},
                    success:function(){
                        location.reload();
                }
            }); 
        });
</script>