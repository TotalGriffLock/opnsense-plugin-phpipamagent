namespace OPNsense\PhpIpamAgent\Api;

use \OPNsense\Base\ApiControllerBase;
use \OPNsense\PhpIpamAgent\PhpIpamAgent;

class SimplifiedSettingsController extends ApiMutableModelControllerBase
{
    protected static $internalModelName = 'phpipamagent';
    protected static $internalModelClass = 'OPNsense\PhpIpamAgent\PhpIpamAgent';
}
