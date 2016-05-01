#
# Author:: Seth Chisamore (<schisamo@chef.io>)
# Cookbook Name:: chef_handler
# Recipe:: default
#
# Copyright 2011-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Chef::Log.info("Chef Handlers will be located at: #{node['chef_handler']['handler_path']}")

remote_directory node['chef_handler']['handler_path'] do
  source 'handlers'
  unless platform?('windows')
    owner node['root_user']
    mode '0755'
    recursive true
  end
  group node['root_group']
  action :nothing
end.run_action(:create)
