# == Class: puppet::service
#
# Manages the puppet master service.
#
# === Parameters
#
# [*puppet_server_service*]
#   The name of the registered puppet master service.
#
class nginx::service inherits nginx::params {
  service { $nginx::params::nginx_server_service:
    ensure => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
  }
}

