define fonts::files($source, $ensure=present, $path='/usr/local/share/fonts') {
  include fonts

  file {"${path}/${name}":
    ensure  => $ensure ? { present => directory, default => $ensure },
    source  => $source,
    recurse => true,
    notify  => Exec['fc-cache'],
  }
}
