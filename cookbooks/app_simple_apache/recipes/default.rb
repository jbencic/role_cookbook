#
# Cookbook:: app_simple_apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file '/var/www/html/test_site/public_html/app.html' do
  source 'app.html'
  owner 'apache'
  group 'apache'
  mode '0644'
  action :create
end
