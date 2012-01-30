# == Class: puppet::params
#
# Declares and sets the parameters necessary for the puppet module.
#
# === Parameters
#
# [*puppet_client_package*]
#   The name of the puppet client package that should be installed. eg puppet
#
# [*puppet_config*]
#   The path to the puppet configuration file. eg /etc/puppet/puppet.conf
#
# [*puppet_server_package*]
#   The name of the puppet master package that should be installed. eg puppet-server
#
# [*puppet_server_service*]
#   The name of the registered puppet master service.
#
class nginx::params {
  case $operatingsystem {
    /(Ubuntu|Debian|RedHat|CentOS|Fedora)/: {
      $nginx_config = '/etc/nginx/nginx.conf'
      $nginx_server_package = 'nginx'
      $nginx_server_service = 'nginx'
    }
  }
}

