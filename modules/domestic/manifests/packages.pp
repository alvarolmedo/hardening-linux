class domestic::packages {

  #To-Do: A define to display warning messages

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
    notify{ "warn":
      message => 'No ubuntu SO detected',
    }
  }

  if $::operatingsystem == 'Ubuntu' {
    package {'apt-transport-https':
      ensure => latest,
    }->
    exec { 'skype_key':
      command => '/usr/bin/curl https://repo.skype.com/data/SKYPE-GPG-KEY | /usr/bin/apt-key add -',
      unless  => '/usr/bin/apt-key list | /bin/grep -i skype'
    }->
    apt::source{ 'skype_repo':
      location => 'https://repo.skype.com/deb',
      release  => 'stable',
      repos    => 'main'
    }->
    package {'skypeforlinux':
      ensure => latest,
    }
  }else {
    notify{ "warn3":
      message => 'No ubuntu SO detected',
    }
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

  package {'vagrant':
    ensure => latest,
  }

  package {'git':
    ensure => latest,
  }
  if $::operatingsystem == 'Ubuntu' {
    $dist = $operatingsystemrelease ? {
      '14.04' => 'trusty',
      '16.04' => 'xenial',
      default => '',
    }
    apt::ppa{ 'ppa:webupd8team/sublime-text-3':
      release => $dist,
    }->
    package {'sublime-text-installer':
      ensure => latest,
    }
  }else{
    notify{ "warn2":
      message => 'No ubuntu SO detected',
    }
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
    ensure => installed,
  }
  package { 'mixxx':
    ensure => latest,
  }
  package { 'remmina':
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
    notify{ "warn3":
      message => 'No ubuntu SO detected',
    }
  }

}
