#
# Cookbook:: docker_config
# Recipe:: 2375 TCP Socket
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# variables
docker_config_folder = "#{node[:docker_config][:config_folder]}"

# make sure the system folder exists
directory '/etc/systemd/system/' do
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end

# ensure the file is correct
cookbook_file '/etc/systemd/system/docker-tcp.socket' do
	source 'docker-tcp.socket'
	owner 'root'
	group 'root'
	mode '0755'
	action :create
end

# restart docker services after enabling the tcp sockets
execute 'restartdocker' do
  command 'systemctl enable docker-tcp.socket'
  notifies :run, 'execute[enabledocker.socket]', :immediately
  notifies :run, 'execute[stopdocker]', :immediately
  notifies :run, 'execute[start-dockertcp]', :immediately
  notifies :run, 'execute[start-docker]', :immediately
 subscribes :run, 'cookbook_file[/etc/systemd/system/docker-tcp.socket]', :immediately
action :nothing
end

execute 'enabledocker.socket' do
  command 'systemctl enable docker.socket'
  action :nothing
end
execute 'stopdocker' do
  command 'systemctl stop docker'
  action :nothing
end
execute 'start-dockertcp' do 
 command 'systemctl start docker-tcp.socket'
 action :nothing
end
 execute 'start-docker' do 
 	command 'systemctl start docker'
  action :nothing
 end