class domestic::packages {

  include apt

  package {'nautilus-dropbox':
    ensure => latest,
  }
  package {'terminator':
    ensure => latest,
  }
  package {'virtualbox':
    ensure => latest,
  }
  package {'unrar':
    ensure => latest,
  }
  package {'ipython':
    ensure => latest,
  }
  package {'dia':
    ensure => latest,
  }
  package {'firefox':
    ensure => latest,
  }
  package {'firefox-locale-es':
    ensure => latest,
  }
  package {'chromium-browser':
    ensure => latest,
  }
  package {'thunderbird':
    ensure => latest,
  }
  package {'thunderbird-locale-es':
    ensure => latest,
  }
  package {'transmission':
    ensure => latest,
  }
  package {'vlc':
    ensure => latest,
  }
  package {'ansible':
    ensure => latest,
  }
  package {'sshpass':
    ensure => latest,
  }

  if $::operatingsystem == 'Ubuntu' {
    apt::source{ 'spotify_repo':
      location => 'http://repository.spotify.com',
      release  => 'stable',
      repos    => 'non-free',
      key      => {
        id     => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
        server => 'hkp://keyserver.ubuntu.com:80',
      }
    }->
    package {'spotify-client':
      ensure => latest,
    }
  }else {
    notice( 'No ubuntu SO detected. Spotify not installed.' )
  }

  if $::operatingsystem == 'Ubuntu' {
    package {'apt-transport-https':
      ensure => latest,
    }->
    exec { 'skype_key':
      command => '/usr/bin/curl https://repo.skype.com/data/SKYPE-GPG-KEY | /usr/bin/apt-key add -',
      unless  => '/usr/bin/apt-key list | /bin/grep -i skype'
    }->
    apt::source{ 'skype-stable':
      location     => 'https://repo.skype.com/deb',
      release      => 'stable',
      repos        => 'main',
      architecture => 'amd64',
    }->
    package {'skypeforlinux':
      ensure => latest,
    }
  }else {
    notice( 'No ubuntu SO detected. Skype not installed.' )
  }

  package {'wine':
    ensure => latest,
  }
  package {'calibre':
    ensure => latest,
  }
  package {'scummvm':
    ensure => latest,
  }
  package {'default-jre':
    ensure => latest,
  }
  if $::operatingsystem == 'Ubuntu' {
    #https://github.com/wolfgang42/vagrant-deb
    #wolfgangmcq+vagrant-deb@gmail.com
    apt::key { 'vagrant-deb.linestarve.com':
      id      => 'AD319E0F7CFFA38B4D9F6E55CE3F3DE92099F7A4',
      server  => 'pgp.mit.edu',
      ensure  => 'present'
    }->
    apt::source{ 'wolfgang42-vagrant':
      location     => 'http://vagrant-deb.linestarve.com/',
      release      => 'any',
      repos        => 'main',
    }->
    package {'vagrant':
      ensure => latest,
    }
  }else{
    notice( 'No ubuntu SO detected. Vagrant installed from distro repos.' )

    package {'vagrant':
      ensure => latest,
    }
  }

  package {'git':
    ensure => latest,
  }

  if $::operatingsystem == 'Ubuntu' {
    apt::source{ 'sublime-text':
      location     => 'https://download.sublimetext.com/',
      release      => 'apt/stable/',
    }->
    package {'sublime-text':
      ensure => latest,
    }
  }else{
    notice( 'No ubuntu SO detected. Sublime not installed.' )
  }

  package {'libreoffice':
    ensure => latest,
  }
  package {'gpart':
    ensure => latest,
  }
  package {'fabric':
    ensure => latest,
  }
  package {'abiword':
    ensure => absent,
  }
  package {'gnumeric':
    ensure => absent,
  }
  package {'moreutils':
    ensure => latest,
  }
  package { 'tmate':
    ensure => latest,
  }
  package { 'ncdu':
    ensure => latest,
  }
  package { 'nethogs':
    ensure => latest,
  }
  package { 'mixxx':
    ensure => latest,
  }
  package { 'network-manager-openconnect':
    ensure => latest,
  }
  package { 'network-manager-openconnect-gnome':
    ensure => latest,
  }
  package { 'openconnect':
    ensure => latest,
  }
  package { 'diffuse':
    ensure => latest,
  }
  package { 'htop':
    ensure => latest,
  }
  package { 'gparted':
    ensure => latest,
  }

  if $::operatingsystem == 'Ubuntu' {
    apt::ppa{ 'ppa:pipelight/stable':
      release => 'stable',
      notify => Exec['apt_update']
    }->
    package {'pipelight-multi':
      ensure => latest,
      install_options => ['--install-recommends'],
    }->
    exec {'update_pipelight':
      command => '/usr/bin/pipelight-plugin --update',
      unless  => '/usr/bin/pipelight-plugin --list-enabled | /bin/grep silverlight5.0'
    }->
    exec {'update_pipelight_2':
      command => '/usr/bin/pipelight-plugin --create-mozilla-plugins',
      unless  => '/usr/bin/pipelight-plugin --list-enabled | /bin/grep silverlight5.0'
    }->
    exec {'enable_pipelight':
      command => '/usr/bin/pipelight-plugin --accept --enable silverlight5.0',
      unless  => '/usr/bin/pipelight-plugin --list-enabled | /bin/grep silverlight5.0'
    }
  }else{
    notice( 'No ubuntu SO detected. Pipelight plugin not installed.' )
  }

  if $::operatingsystem == 'Ubuntu' {
    apt::ppa{ 'ppa:remmina-ppa-team/remmina-next':
      release => $::lsbdistcodename,
    }->
    package {'libfreerdp-plugins-standard':
      ensure => latest,
    }->
    package {'remmina-plugin-rdp':
      ensure => latest,
    }->
    package {'remmina':
      ensure => latest,
    }
  }else{
    notice( 'No ubuntu SO detected. Remmina installed from distro repos.' )
    
    package {'remmina':
      ensure => latest,
    }
  }

  if $::operatingsystem == 'Ubuntu' {
    apt::source{ 'google-chrome':
      location     => 'http://dl.google.com/linux/chrome/deb/',
      release      => 'stable',
      repos        => 'main',
      architecture => 'amd64',
    }->
    package {'google-chrome-stable':
      ensure => latest,
    }
  }else {
    notice( 'No ubuntu SO detected. Chrome not installed.' )
  }

}
