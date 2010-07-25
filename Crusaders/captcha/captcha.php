<?php
   session_start();
   unset($_SESSION['captcha_spam']);

   function randomString($len) {
      function make_seed(){
         list($usec , $sec) = explode (' ', microtime());
         return (float) $sec + ((float) $usec * 100000);
      }
      srand(make_seed());  
                       
      //Der String $possible enth�lt alle Zeichen, die verwendet werden sollen
      $possible="ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789";
      $str="";
      while(strlen($str)<$len) {
        $str.=substr($possible,(rand()%(strlen($possible))),1);
      }
   return($str);
   }

   $text = randomString(5);  //Die Zahl bestimmt die Anzahl stellen
   $_SESSION['captcha_spam'] = $text;
         
   header('Content-type: image/png');
   $img = ImageCreateFromPNG('captcha.PNG'); //Backgroundimage
   $color = ImageColorAllocate($img, 0, 0, 0); //Farbe
   $ttf = "XFILES.TTF"; //Schriftart
   $ttfsize = 20; //Schriftgr�sse
   $angle = rand(0,0);
   $t_x = rand(0,20);
   $t_y = 25;
   imagettftext($img, $ttfsize, $angle, $t_x, $t_y, $color, $ttf, $text);
   imagepng($img);
   imagedestroy($img);
?> 