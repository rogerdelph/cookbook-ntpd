#
# Cookbook Name:: ntpd
# Recipe:: default
#

# The Network Time Protocol is used to manage the system clock over a network. Computer
# clocks are not very accurate, so time will drift on unmanaged systems. If every machine
# on your network reliably reports the same time as every other machine, then it is much
# easier to correlate log messages in case of an attack. In addition, a number of
# cryptographic protocols (such as Kerberos) use timestamps to prevent certain types of
# attacks. If your network does not have synchronized time, these protocols may be
# unreliable or even unusable.

yum_package 'ntp' do
  action :install
end

service 'ntpd' do
  action [:enable, :start]
end

# ntpdate is a computer program used to quickly synchronize and set computers' date and
# time by querying a Network Time Protocol (NTP) server.

yum_package 'ntpdate' do
  action :install
end

# The /etc/ntp.conf file contains the configuration for the ntpd service.  The template
# (ntp.conf.erb) is used to set log file locations, restrict access to the service to
# the local server, configure the name servers, etc.  If the file chanes the ntpd
# service has be be restarted.

template '/etc/ntp.conf' do
  source 'ntp.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[ntpd]'
end
