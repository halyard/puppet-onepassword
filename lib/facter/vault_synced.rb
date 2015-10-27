Facter.add('vault_synced') do
  confine :osfamily => 'Darwin'

  def user
    Facter.value(:boxen_user)
  end

  def settings_file
    File.expand_path "/Users/#{user}/Dropbox/.ws.agile.1Password.settings"
  end

  def vault_file
    File.join File.dirname(settings_file), File.read(settings_file)
  end

  def vault_synced?
    return false unless File.exist? settings_file
    return false unless Dir.exist? vault_file
    true
  end

  setcode do
    vault_synced?
  end
end
