#
# Cookbook Name:: eclipse0
# Recipe:: default
#
# Copyright 2016, zurga.com
#
# All rights reserved - Do Not Redistribute
#


remote_file "/tmp/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz" do
  source "http://eclipse.bluemix.net/packages/mars.1/data/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz"
  owner "root"
  group "root"
  mode "0755"
  action :create
end

cookbook_file "/usr/share/applications/eclipse.desktop" do
  source "eclipse.desktop"
  owner "root"
  group "root"
  mode "0755"
  action :create
end

bash "Install Eclipse" do
  user "root"
  code <<-EOF
    #wget http://eclipse.bluemix.net/packages/mars.1/data/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz
    sudo tar xzvf /tmp/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz -C /usr/ 
    sudo ln -s /usr/eclipse/eclipse /usr/bin/eclipse
  EOF
end