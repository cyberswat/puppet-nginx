# == Class: nginx::install
#
# Installs the nginx server.
#
# === Parameters
#
# [*nginx_server_package*]
#   The name of the nginx server package that should be installed. eg nginx
#
class nginx::install inherits nginx::params {

  file { "/etc/yum.repos.d/nginx.repo":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => 0644,
    content => template("nginx/yum_nginx_repo.erb"),
  }


#  exec { "/usr/bin/add-apt-repository ppa:nginx/php5 && apt-get update":
#    alias => "nginx_ph5_repository",
#    require => Package["python-software-properties"],
#    creates => "/etc/apt/sources.list.d/nginx-php5-lucid.list",
#  }

  package { $nginx::params::nginx_server_package:
    ensure => present,
  }
}

