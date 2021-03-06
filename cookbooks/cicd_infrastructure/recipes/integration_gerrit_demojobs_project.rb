# Encoding: utf-8
#
# Cookbook Name:: cicd-infrastructure
# Recipe:: integration_gerrit_demojobs_project
#
# Copyright (c) 2014 Grid Dynamics International, Inc. All Rights Reserved
# Classification level: Public
# Licensed under the Apache License, Version 2.0.
#

execute 'Create jenkins asf-webapp jobs repo' do
  command 'ssh -p 29418 root@localhost gerrit create-project --name "asf-webapp-jenkins-jobs"'
  user node['gerrit']['user']
  action :run
end
