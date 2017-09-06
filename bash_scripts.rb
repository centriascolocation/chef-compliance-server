# -*- mode: ruby -*-
# vi: set ft=ruby :

# The provision scripts assume that the VMs are Debian/Ubuntu
$script_1 = <<SCRIPT_1
apt-get update -y -qq
apt-get upgrade -y -qq
SCRIPT_1

# Install essential packages
$script_2 = <<SCRIPT_2
DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common git curl wget openssl libssl-dev build-essential make \
apt-transport-https ca-certificates python-pip
SCRIPT_2

# Install Chef Compliance Server
$script_3 = <<SCRIPT_3
wget --no-clobber -q -O /tmp/chef-compliance-1.11.5.deb https://packages.chef.io/files/stable/chef-compliance/1.11.5/ubuntu/16.04/chef-compliance_1.11.5-1_amd64.deb
dpkg -i /tmp/chef-compliance-1.15.5.deb
chef-compliance-ctl reconfigure --accept-license
SCRIPT_3
