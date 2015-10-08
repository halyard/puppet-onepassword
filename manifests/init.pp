# == Class: onepassword
#
# Full description of class onepassword here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class onepassword (
  $install_path = "/Users/${::boxen_user}/Applications/1Password 5.app"
) {
  class { '::onepassword::config': } ->
  package { 'onepassword-beta-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  } ->
  osx_login_item { '1Password 5':
    path   => $install_path
  } ~>
  exec { 'launch 1password':
    command     => "/usr/bin/open '${install_path}'",
    refreshonly => true,
  }
}
