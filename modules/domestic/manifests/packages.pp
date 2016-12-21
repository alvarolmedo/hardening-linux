class domestic::packages inherits domestic {

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
  package {'google-chrome-stable':
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

  if $::operatingsystem != 'Ubuntu' {
    apt::source{ 'spotify_repo':
      location => 'http://repository.spotify.com',
      release => 'stable',
      repos => 'non-free'
    }->
    package {'spotify-client':
      ensure => latest,
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
  package {'openjdk-7-jre':
    ensure => latest,
  }

  package {'vagrant':
    ensure => latest,
  }

  package {'git':
    ensure => latest,
  }
  if $::operatingsystem != 'Ubuntu' {
    $dist = $operatingsystemrelease ? {
      '14.04' => 'trusty',
      '16.04' => 'xenial',
      default => '',
    }
    apt::source{ 'sublime_repo':
      location => 'http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu',
      release => $dist,
      repos => 'main'
    }->
    package {'sublime-text':
      ensure => latest,
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
  package {'fabric':
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
}
