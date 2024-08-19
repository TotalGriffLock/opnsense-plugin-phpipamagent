PLUGIN_NAME=           phpipamagent
PLUGIN_VERSION=        0.1
PLUGIN_COMMENT=        Scan agent for phpIPAM
PLUGIN_DEPENDS=        php${PLUGIN_PHP}-gmp php${PLUGIN_PHP}-pdo_mysql php${PLUGIN_PHP}-iconv php${PLUGIN_PHP}-posix fping
PLUGIN_MAINTAINER=     john@theshado.ws
PLUGIN_TIER=           3

.include "../../Mk/plugins.mk"
