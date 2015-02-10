node 'default' {
  user { 'aolmedo':
	ensure => present,
	home   => '/home/aolmedo',
	comment => 'Alvaro Olmedo',
	password => '$1$GRs789q9$.q5zGITTZP2Rb.ZA13bFT/'
  }
  package {'dropbox':
    ensure => latest,
  }
  package {'terminator':
    ensure => latest,
  }
  package {'virtualbox':
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
  package {'spotify-client':
    ensure => latest,
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
  package {'sublime-text':
    ensure => latest,
  }
}
