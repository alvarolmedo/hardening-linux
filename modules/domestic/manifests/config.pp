class domestic::config inherits domestic {
  user { 'aolmedo':
    ensure   => present,
    home     => '/home/aolmedo',
    comment  => 'Alvaro Olmedo',
    password => '$1$GRs789q9$.q5zGITTZP2Rb.ZA13bFT/'
  }->
  file { '/home/aolmedo/.tmux.conf':
    ensure  => file,
    owner => aolmedo,
    group => aolmedo,
    mode   => 0600,
    content => template('domestic/tmux.conf.erb')
  }
}