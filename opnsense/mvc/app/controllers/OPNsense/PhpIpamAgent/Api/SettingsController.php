<?php
namespace OPNsense\PhpIpamAgent\Api;

use \OPNsense\Base\ApiControllerBase;
use \OPNsense\PhpIpamAgent\PhpIpamAgent;
use \OPNsense\Core\Config;

class SettingsController extends ApiControllerBase
{
/**
 * retrieve PhpIpamAgent general settings
 * @return array general settings
 */
public function getAction()
{
    // define list of configurable settings
    $result = array();
    if ($this->request->isGet()) {
        $mdlPhpIpamAgent = new PhpIpamAgent();
        $result['phpipamagent'] = $mdlPhpIpamAgent->getNodes();
    }
    return $result;
}

/**
 * update PhpIpamAgent settings
 * @return array status
 */
public function setAction()
{
    $result = array("result"=>"failed");
    if ($this->request->isPost()) {
        // load model and update with provided data
        $mdlPhpIpamAgent = new PhpIpamAgent();
        $mdlPhpIpamAgent->setNodes($this->request->getPost("phpipamagent"));

        // perform validation
        $valMsgs = $mdlPhpIpamAgent->performValidation();
        foreach ($valMsgs as $field => $msg) {
            if (!array_key_exists("validations", $result)) {
                $result["validations"] = array();
            }
            $result["validations"]["phpipamagent.".$msg->getField()] = $msg->getMessage();
        }

        // serialize model to config and save
        if ($valMsgs->count() == 0) {
            $mdlPhpIpamAgent->serializeToConfig();
            Config::getInstance()->save();
            $result["result"] = "saved";
        }
    }
    return $result;
}
}
