define fonts::files($ensure=present, $source='', $path='/usr/local/share/fonts') {
  include fonts

  if $ensure == 'present' and $source == '' {
    fail "Must pass source to Fonts::Files[${name}]"
  }

  file {"${path}/${name}":
    ensure  => $ensure ? { present => directory, default => $ensure },
    source  => $source,
    recurse => true,
    notify  => Exec['fc-cache'],
  }
}
