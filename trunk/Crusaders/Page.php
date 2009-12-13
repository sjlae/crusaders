<?php

interface Page {
	public function getView();
}

abstract class HTMLPage {

	public function getView() {
		if($this->init()) {
			require_once('Layout/header.tpl');
			$this->getHTML();
			require_once('Layout/footer.tpl');
		}
	}
	
	public function init() {
		return true;
	}
	
	public abstract function getHTML();
}

?>