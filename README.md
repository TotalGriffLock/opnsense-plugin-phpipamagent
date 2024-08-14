# opnsense-plugin-phpipamagent
A plugin for OPNsense to run the PHP IPAM scan agent directly on the firewall

## Description
This plugin uses the phpIPAM agent from https://github.com/phpipam/phpipam-agent/ and deploys it onto an OPNsense firewall as a plugin.

## Important
This incorporates work from both https://github.com/phpipam/phpipam-agent/ and from https://medium.com/@mihakralj/the-direct-route-installing-freebsd-packages-on-opnsense-d002ac0c56b8 - it is in no way all my own work nor do I claim it to be

## Manual Installation
For now, this is not bundled as a plugin, so to install get a shell on your OPNsense and run
```
cd ~
rm -Rf opnsense-plugin-phpipamagent
rm -Rf /usr/local/opnsense/scripts/phpipamagent
pkg install git
pkg install fping
git clone --recursive https://github.com/TotalGriffLock/opnsense-plugin-phpipamagent opnsense-plugin-phpipamagent
git clone --recursive https://github.com/phpipam/phpipam-agent/ /usr/local/opnsense/scripts/phpipamagent
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-gmp
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-pdo_mysql
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-iconv
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-posix
cp -R ~/opnsense-plugin-phpipamagent/src/opnsense /usr/local/
service configd restart
configctl service restart webgui
```
To manually update an existing manual installation
```
cd ~
rm -Rf opnsense-plugin-phpipamagent
rm -Rf /usr/local/opnsense/scripts/phpipamagent
git clone --recursive https://github.com/TotalGriffLock/opnsense-plugin-phpipamagent opnsense-plugin-phpipamagent
git clone --recursive https://github.com/phpipam/phpipam-agent/ /usr/local/opnsense/scripts/phpipamagent
cp -R ~/opnsense-plugin-phpipamagent/src/opnsense /usr/local/
service configd restart
configctl service restart webgui
```
## Building The Plugin
To build the plugin from source:

Set up OPNsense tools as per https://github.com/opnsense/tools - you can do this on an OPNsense VM or a FreeBSD box

Run the following commands in the tools environment
```
cd /usr/plugins/devel/
git clone --recursive https://github.com/TotalGriffLock/opnsense-plugin-phpipamagent /usr/plugins/devel/phpipamagent
git clone --recursive https://github.com/phpipam/phpipam-agent /usr/plugins/devel/phpipamagent/src/opnsense/scripts/phpipamagent
cd /usr/tools
make plugins
```
This should result in /
## Usage
Create the scan agent in phpIPAM's Administration menu

Follow the instructions from https://github.com/phpipam/phpipam-agent/ to set up MySQL permissions (the 'GRANT' commands)

Navigate to Services -> phpIPAM Agent -> Configuration in the OPNsense menu

Fill out your Agent Code from phpIPAM, and all your database settings. Click Save and click Run one-off discovery. This will test the database connection out and check the agent code is valid.

Assign some subnets to this agent in phpIPAM

Create some cron jobs in OPNsense to run regular scans at System -> Settings -> Cron. The commands to add are "Run an IPAM discovery task" and "Run an IPAM update task". The agent author recommends both to run every 15 minutes.
