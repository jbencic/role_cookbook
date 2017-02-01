#
# Cookbook:: wrap_simple_apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'lib_simple_apache'

site_name     = 'test_site'
document_root = "/var/www/html/#{site_name}"

directory "#{document_root}/public_html" do
  mode '0755'
  recursive true
  owner 'apache'
  group 'apache'
end

template '/etc/httpd/conf.d/vhost.conf' do
  source 'virtualhosts.erb'
  mode '0644'
  variables(
    document_root: document_root,
    site: site_name,
    port: node['httpd']['port'],
    serveradmin: node['httpd']['serveradmin'],
    servername: node['httpd']['servername']
  )
end

service "httpd" do
  action [:enable, :restart]
end
