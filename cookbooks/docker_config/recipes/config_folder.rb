#
# Cookbook:: docker_config
# Recipe:: config_folder
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# variables
docker_config_folder = "#{node[:docker_config][:config_folder]}"

# make sure the docker configuration folder exists
directory docker_config_folder do
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end
