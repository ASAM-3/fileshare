platform = (/i[3456]86/ =~ node['kernel']['machine']) ? "i386" : "x86_64"

# zabbix common setting
default['zabbix']['version'] = "2.2.1"
default['zabbix']['major_version'] = node['zabbix']['version'].slice(0, 3)

version = node['zabbix']['version']
major_version = node['zabbix']['major_version']

# zabbix release rpm setting
default['zabbix']['release_rpm_filename'] = "zabbix-release-#{major_version}-1.el6.noarch.rpm"

release_rpm_filename = node['zabbix']['release_rpm_filename']
default['zabbix']['release_rpm_url'] = "http://repo.zabbix.com/zabbix/#{major_version}/rhel/6/#{platform}/#{release_rpm_filename}"

default['zabbix']['release_cache_dir'] = Chef::Config['file_cache_path']

# zabbix server setting
default['zabbix']['server']['ipaddr'] = "127.0.0.1"

default['zabbix']['server']['packages'] = %w[
  zabbix-server-mysql
  zabbix-web-mysql
  zabbix-web-japanese
]

default['zabbix']['adminuser'] = 'Admin'
default['zabbix']['adminpassword'] = 'zabbix'

# mysql
#default['mysql']['version'] = "5.6.19-2.el6"
default['mysql']['version'] = nil

# mysql repository
default['mysql']['repo_filename'] = "mysql-community-release-el6-5.noarch.rpm"
default['mysql']['repo_url'] = "http://dev.mysql.com/get/#{node['mysql']['repo_filename']}"

# mysql my.cnf
default['zabbix']['server']['mysql']['buffer_pool_size'] = "64M"
default['zabbix']['server']['mysql']['log_file_size'] = "16M"
default['zabbix']['server']['mysql']['log_files_in_group'] = "2"

default['zabbix']['server']['mysql']['import_sql_dir'] = "/usr/share/doc/zabbix-server-mysql-#{version}/create"

default['zabbix']['server']['mysql']['dbhost'] = "localhost"
default['zabbix']['server']['mysql']['dbname'] = "zabbix"
default['zabbix']['server']['mysql']['dbuser'] = "zabbix"
default['zabbix']['server']['mysql']['dbpassword'] = "zabbix"

# zabbix agent setting
default['zabbix']['agent']['hostname'] = "localhost"
default['zabbix']['agent']['ipaddr'] = "127.0.0.1"

default['zabbix']['agent']['template_list'] = [
  "Template OS Linux"
]

default['zabbix']['agent']['hostgroup'] = "Linux servers"

# zabbix windows agent
default['zabbix']['agent']['windows']['zip_filename'] = "zabbix_agents_#{version}.win.zip"

zip_filename = node['zabbix']['agent']['windows']['zip_filename']
default['zabbix']['agent']['windows']['zip_url'] = "http://www.zabbix.com/downloads/#{version}/#{zip_filename}"
default['zabbix']['agent']['windows']['zip_path'] = File.join(Chef::Config[:file_cache_path], zip_filename)

default['zabbix']['agent']['windows']['install_path'] = File.join("C:", "Zabbix Agent")
default['zabbix']['agent']['windows']['conf_path'] = File.join(node['zabbix']['agent']['windows']['install_path'], "conf", "zabbix_agentd.win.conf")

default['zabbix']['agent']['windows']['bin_path'] = File.join(node['zabbix']['agent']['windows']['install_path'], "win64", "zabbix_agentd.exe")
