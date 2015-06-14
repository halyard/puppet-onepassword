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
) {
  package { 'onepassword-beta-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
}
