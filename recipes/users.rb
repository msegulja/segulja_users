#
# Cookbook:: segulja_users
# Recipe:: users
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'chef-vault'

node['users']['create'].each do |u|
  vault = chef_vault_item('credentials', 'users')

  if node['etc']['passwd'].attribute?(u.to_s)
    user u.to_s do
      comment     vault[u.to_s]['comment']
      uid         vault[u.to_s]['userID']
      home        vault[u.to_s]['home']
      shell       '/bin/bash'
      password    vault[u.to_s]['password']
      action      :modify
      not_if      { u == 'root' }
    end
  else
    user u.to_s do
      comment     vault[u.to_s]['comment']
      uid         vault[u.to_s]['userID']
      gid         vault[u.to_s]['groupID']
      home        vault[u.to_s]['home']
      shell       '/bin/bash'
      password    vault[u.to_s]['password']
      manage_home true
      action      :create
      not_if      { u == 'root' }
    end
  end
end
