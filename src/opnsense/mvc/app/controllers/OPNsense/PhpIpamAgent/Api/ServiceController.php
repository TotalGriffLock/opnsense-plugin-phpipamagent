<?php
namespace OPNsense\PhpIpamAgent\Api;

use \OPNsense\Base\ApiControllerBase;
use \OPNsense\Core\Backend;

class ServiceController extends ApiControllerBase
{
  public function reloadAction()
{
    $status = "failed";
    if ($this->request->isPost()) {
        $backend = new Backend();
        $bckresul1 = trim($backend->configdRun("template reload OPNsense/PhpIpamAgent"));
        if ($bckresult == "OK") {
            $status1 = "ok";
        }
        $bckresult = trim($backend->configdRun("phpipamagent phpipamagentsslconf"));
        if ($bckresult == "OK") {
            $status2 = "ok";
        }
        if ($status1 == "ok" && $status2 == "ok") {
            $status = "ok";
        }
    }
    return array("message" => $status);
}

  public function discoAction()
{
    if ($this->request->isPost()) {
        $backend = new Backend();
        $bckresult = json_decode(trim($backend->configdRun("phpipamagent phpipamagentdiscover")), true);
//        if ($bckresult !== null) {
            // only return valid json type responses
            return $bckresult;
//        }
    }
//    return array("message" => "unable to run configd discovery action");
}

    public function updateAction()
{
    if ($this->request->isPost()) {
        $backend = new Backend();
        $bckresult = json_decode(trim($backend->configdRun("phpipamagent phpipamagentupdate")), true);
//        if ($bckresult !== null) {
            // only return valid json type responses
            return $bckresult;
//        }
    }
 //   return array("message" => "unable to run configd update action");
}
}
