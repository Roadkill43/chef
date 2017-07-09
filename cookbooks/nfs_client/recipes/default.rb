#
# Cookbook:: nfs_client
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


# install NFS client
package 'Install nfs_client' do
  case node[:platform]
  when 'ubuntu', 'debian'
    package_name 'nfs-common'
  end
end