# Encoding: utf-8
#
# Cookbook Name:: cicd-infrastructure
# Attributes:: gerrit
#
# Copyright (c) 2014 Grid Dynamics International, Inc. All Rights Reserved
# Classification level: Public
# Licensed under the Apache License, Version 2.0.
#

default['gerrit']['version'] = "2.8.6.1"

if node['cloud']
  case node['cloud']['provider']
  when "ec2"
    default['gerrit']['hostname'] = node['cloud']['public_hostname']
  when "rackspace"
    default['gerrit']['hostname'] = node['cloud']['private_hostname']
  end
end

default['gerrit']['canonicalWebUrl'] = "http://#{node['gerrit']['hostname']}/"

default['gerrit']['auth']['registerEmailPrivateKey'] = 'gerrit'
default['gerrit']['auth']['restTokenPrivateKey'] = 'gerrit'
default['gerrit']['sendemail']['enable'] = 'false'