<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
		$this->load->view('html_header');
		$this->load->view('landing');
		$this->load->view('elements/posts');
		$this->load->view('html_footer');
	}
}
