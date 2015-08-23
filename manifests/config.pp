class onepassword::config (
  $domain = '2BUA8C4S2C.com.agilebits.onepassword4-helper'
) {
  Boxen::Osx_defaults {
      user   => $::boxen_user,
      domain => $domain
  }

  boxen::osx_defaults { 'Enable 1Password watchtower':
    key   => 'watchtowerService',
    value => 1,
    type  => 'integer'
  }

  boxen::osx_defaults { "Don't animate fill for 1Password":
    key   => 'animateFill',
    value => 0,
    type  => 'integer'
  }

  boxen::osx_defaults { "Use newer OPVault format":
    key   => 'useOPVaultFormatByDefault',
    value => true,
    type  => 'boolean'
  }
}
