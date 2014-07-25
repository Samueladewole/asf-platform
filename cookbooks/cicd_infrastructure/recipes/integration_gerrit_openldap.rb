# Encoding: utf-8
#
# Cookbook Name:: cicd-infrastructure
# Attributes:: integration_gerrit_openldap
#
# Copyright 2014, Grid Dynamics International, Inc.
#

gerrit_config = node['cicd_infrastructure']['gerrit']

node.set['gerrit']['auth']['type'] = gerrit_config['auth']['type']
node.set['gerrit']['ldap'] = gerrit_config['ldap']

service 'gerrit' do
    action :nothing
end

template "#{node['gerrit']['install_dir']}/etc/gerrit.config" do
  source 'gerrit/gerrit.config'
  cookbook 'gerrit'
  owner node['gerrit']['user']
  group node['gerrit']['group']
  mode 0644
  notifies :restart, 'service[gerrit]'
end
