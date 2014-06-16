# install 7-zip
include_recipe '7-zip::default'

# download zabbix-agent
zip_path = node['zabbix']['agent']['windows']['zip_path'] 
remote_file zip_path do
  source node['zabbix']['agent']['windows']['zip_url']
end

# unzip zabbix-agent
install_path = node['zabbix']['agent']['windows']['install_path']
execute "unzip zabbix-agent" do
  command "7z.exe x #{zip_path} -o#{install_path}"
  not_if { File.exists?(install_path) }
end

# configure zabbix_agentd.win.conf


# install zabbix-agent
