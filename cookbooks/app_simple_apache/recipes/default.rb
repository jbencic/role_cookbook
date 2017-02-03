#
# Cookbook:: app_simple_apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

environment = node.chef_environment

template '/var/www/html/test_site/public_html/app.html' do
  source 'app.html.erb'
  owner 'apache'
  group 'apache'
  mode '0644'
  variables(
    environment: environment
  )
end
