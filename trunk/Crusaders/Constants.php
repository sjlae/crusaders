<?php

class Constants{
	public static function isLocal(){
		if($_SERVER[HTTP_HOST] == "localhost"){
			return true;
		}
		return false;
	}
}

?>