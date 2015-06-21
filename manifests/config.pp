class onepassword::config (
  $domain = '2BUA8C4S2C.com.agilebits.onepassword4-helper'
) {
  Boxen::Osx_defaults {
      user   => $::boxen_user,
      domain => $domain
  }

  boxen::osx_defaults { 'Prevent 1Password update checks':
    key   => 'CheckForSoftwareUpdatesEnabled',
    value => 0,
    type  => 'integer'
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

  boxen::osx_defaults { '1Password: hide backup notifications':
    key   => 'ShowBackupCompletedNotifications',
    value => 0,
    type  => 'integer'
  }
}
