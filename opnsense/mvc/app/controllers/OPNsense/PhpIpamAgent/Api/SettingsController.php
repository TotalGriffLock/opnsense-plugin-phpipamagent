<?php
namespace OPNsense\PhpIpamAgent\Api;

use \OPNsense\Base\ApiControllerBase;
use \OPNsense\PhpIpamAgent\PhpIpamAgent;

class SettingsController extends ApiControllerBase
{
}
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