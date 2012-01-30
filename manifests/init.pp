# == Class: nginx
#
# Manages the nginx server.
#
class nginx {
  include nginx::install
  include nginx::service
}

