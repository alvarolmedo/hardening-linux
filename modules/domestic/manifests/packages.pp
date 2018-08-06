class domestic::packages {

  include apt

  package {'psensor':
    ensure => latest,
  }
  package {'xfce4-sensors-plugin':
    ensure => latest,
  }
  package {'meld':
    ensure => latest,
  }
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
  package {'pass':
    ensure => latest,
  }
  package {'python-dev':
    ensure => latest,
  }
  package {'python-pypandoc':
    ensure => latest,
  }
  package {'virtualenv':
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
  package {'python-pip':
    ensure => latest,
  }
  package {'sshpass':
    ensure => latest,
  }
  package {'openvpn':
    ensure => latest,
  }
  package {'network-manager-openvpn-gnome':
    ensure => latest,
  }
  if $::operatingsystem == 'Ubuntu' {
    apt::source{ 'spotify_repo':
      location => 'http://repository.spotify.com',
      release  => 'stable',
      repos    => 'non-free',
      key      => {
        id     => '0DF731E45CE24F27EEEB1450EFDC8610341D9410',
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
    exec { 'skype_key':
      command => '/usr/bin/curl https://repo.skype.com/data/SKYPE-GPG-KEY | /usr/bin/apt-key add -',
      unless  => '/usr/bin/apt-key list | /bin/grep -i skype'
    }->
    apt::source{ 'skype-unstable':
      location     => 'https://repo.skype.com/deb',
      release      => 'unstable',
      repos        => 'main',
      architecture => 'amd64',
      require      => Package['apt-transport-https'],
    }->
    package {'skypeforlinux':
      ensure => latest,
    }
  }else {
    notice( 'No ubuntu SO detected. Skype not installed.' )
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

  package {'apt-transport-https':
    ensure => latest,
  }

  if $::operatingsystem == 'Ubuntu' {
    exec { 'sublime-text_key':
      command => '/usr/bin/wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -',
      unless  => '/usr/bin/apt-key list | /bin/grep -i sublime'
    }->
    apt::source{ 'sublime-text':
      location => 'https://download.sublimetext.com/',
      release  => 'apt/stable/',
      repos    => '',
      require  => Package['apt-transport-https'],
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
  package {'libreoffice-help-es':
    ensure => latest,
  }
  package {'libreoffice-l10n-es':
    ensure => latest,
  }
  package {'hunspell-es':
    ensure => latest,
  }
  package {'hyphen-es':
    ensure => latest,
  }
  package {'mythes-es':
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
    exec { 'google-chrome_key':
      command => '/usr/bin/wget -qO - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -',
      unless  => '/usr/bin/apt-key list | /bin/grep -i google'
    }->
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
