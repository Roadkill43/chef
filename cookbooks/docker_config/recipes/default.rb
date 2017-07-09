#
# Cookbook:: docker_config
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "docker_config::config_folder"

include_recipe "docker_config::2375socket"
