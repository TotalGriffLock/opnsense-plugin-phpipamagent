# opnsense-plugin-phpipamagent
A plugin for OPNsense to run the PHP IPAM agent directly on the firewall

## Description
This plugin uses the phpIPAM agent from https://github.com/phpipam/phpipam-agent/ and deploys it onto an OPNsense firewall as a plugin.

## Installation
For now, this is not bundled as a plugin, so to install get a shell on your OPNsense and run
```
cd ~
rm -Rf opnsense-plugin-phpipamagent
git clone https://github.com/TotalGriffLock/opnsense-plugin-phpipamagent opnsense-plugin-phpipamagent
cp -R ~/opnsense-plugin-phpipamagent/opnsense /usr/local/
service configd restart
```
