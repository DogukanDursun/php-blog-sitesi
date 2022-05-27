<?php


include "sistem/veritabani-baglantisi.php";


extract($_POST);
    if ($_POST){

        if (!$yorum_ekleyen || !$yorum_eposta || !$yorum_icerik){
            echo "bos";
        }else{
            $query = $db->prepare("INSERT INTO yorumlar SET yorum_ekleyen=?, yorum_eposta=?,yorum_icerik=?, yorum_yazi_id=?, yorum_ust=?");
            $insert = $query->execute(array($yorum_ekleyen,$yorum_eposta,$yorum_icerik,$yorum_yazi_id,0));

            if ($insert){
                echo "yes";
            }else{
                echo "no";
            }
        }

    }
?>