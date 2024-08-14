# opnsense-plugin-phpipamagent
A plugin for OPNsense to run the PHP IPAM agent directly on the firewall

## Description
This plugin uses the phpIPAM agent from https://github.com/phpipam/phpipam-agent/ and deploys it onto an OPNsense firewall as a plugin.

## Important
This incorporates work from both https://github.com/phpipam/phpipam-agent/ and from https://medium.com/@mihakralj/the-direct-route-installing-freebsd-packages-on-opnsense-d002ac0c56b8 - it is in no way all my own work nor do I claim it to be

## Installation
For now, this is not bundled as a plugin, so to install get a shell on your OPNsense and run
```
cd ~
rm -Rf opnsense-plugin-phpipamagent
rm -Rf phpipam-agent
pkg install git
pkg install fping
git clone --recursive https://github.com/TotalGriffLock/opnsense-plugin-phpipamagent opnsense-plugin-phpipamagent
git clone --recursive https://github.com/phpipam/phpipam-agent/ phpipam-agent
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-gmp
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-pdo_mysql
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-iconv
echo y | sh opnsense-plugin-phpipamagent/FreeBSD_sideload.sh php82-posix
rm -Rf /usr/local/share/phpipam-agent
mv phpipam-agent /usr/local/share/phpipam-agent
cp -R ~/opnsense-plugin-phpipamagent/opnsense /usr/local/
service configd restart
configctl service restart webgui
```
## Usage
Create the scan agent in phpIPAM's Administration menu

Follow the instructions from https://github.com/phpipam/phpipam-agent/ to set up MySQL permissions (the 'GRANT' commands)

Navigate to Services -> phpIPAM Agent -> Configuration in the OPNsense menu

Fill out your Agent Code from phpIPAM, and all your database settings. Click Save and click Run one-off discovery. This will test the database connection out and check the agent code is valid.

Assign some subnets to this agent in phpIPAM

Create some cron jobs in OPNsense to run regular scans at System -> Settings -> Cron. The commands to add are "Run an IPAM discovery task" and "Run an IPAM update task". The agent author recommends both to run every 15 minutes.
