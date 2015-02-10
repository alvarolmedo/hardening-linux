class domestic::config inherits domestic {
  user { 'aolmedo':
    ensure   => present,
    home     => '/home/aolmedo',
    comment  => 'Alvaro Olmedo',
    password => '$1$GRs789q9$.q5zGITTZP2Rb.ZA13bFT/'
  }
}