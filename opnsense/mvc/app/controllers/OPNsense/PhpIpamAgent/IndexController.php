<?php
namespace OPNsense\PhpIpamAgent;
class IndexController extends \OPNsense\Base\IndexController
{
    public function indexAction()
    {
        // pick the template to serve to our users.
        $this->view->pick('OPNsense/PhpIpamAgent/index');
		$this->view->generalForm = $this->getForm("general");
    }
}