define fonts::typeface($source, $ensure=present, $path='/usr/local/share/fonts') {
  include fonts

  file {"${path}/${name}":
    ensure => $ensure,
    source => $source,
    notify => Exec['fc-cache'],
  }
}
