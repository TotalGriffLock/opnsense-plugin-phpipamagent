<?php
namespace OPNsense\PhpIpamAgent\Api;

use \OPNsense\Base\ApiMutableModelControllerBase;
use \OPNsense\PhpIpamAgent\PhpIpamAgent;
use OPNsense\Core\Config;

class SimplifiedSettingsController extends ApiMutableModelControllerBase
{
    protected static $internalModelName = 'phpipamagent';
    protected static $internalModelClass = 'OPNsense\PhpIpamAgent\PhpIpamAgent';
}
