define fonts::file($ensure=present, $source='', $path='/usr/local/share/fonts') {
  include fonts

  if $ensure == 'present' and $source == '' {
    fail "Must pass source to Fonts::File[${name}]"
  }

  file {"${path}/${name}":
    ensure => $ensure,
    source => $source,
    notify => Exec['fc-cache'],
  }
}
