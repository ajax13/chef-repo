#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "apt"

#  Resource => package
#  Resources do not describe how to do something; 
#  They simply describe what a part of the system should look like when it is complete
package 'nginx' do
  action :install     # action :install. This line tells Chef that the resource we are describing should be installed
end

service 'nginx' do
  action [ :enable, :start ]
end

# transfert cookbook_file to node
cookbook_file "/var/www/html/index.html" do
  source "index.html"  # file name of the file to look for within the cookbook located within the "files/default" 
  mode "0644"
end