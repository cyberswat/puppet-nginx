# == Class: puppet::config
#
# Manages variables for both puppet client and puppet master.
#
# === Variables
#
# [*master*]
#   The fully qualified name of the puppet master.  Will default to the puppets
#   fqdn.
#   Default: $fqdn
#   Optional: yes
#
# === Examples
#
#  class { 'puppet::config' :
#    master => 'puppet.example.com'
#  }
#
class nginx::config(
  listen,
  server_name,
  root
) inherits nginx::params {

  file { $nginx::params::nginx_config:
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 0644,
    content => template("nginx/nginx_conf.erb"),
    require => Class["nginx::install"],
    notify => Class["nginx::service"],
  }

  file { "/etc/nginx/conf.d/default.conf":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 0644,
    content => template("nginx/etc_nginx_confd_default.erb"),
    require => Class["nginx::install"],
    notify => Class["nginx::service"],
  }

  file { $root:
    ensure => directory,
    owner => 'nginx',
    group => 'nginx',
    mode => 0755,
  }

}

