define fonts::file(
  $ensure = present,
  $source = undef,
  $path   = '/usr/local/share/fonts'
) {
  include ::fonts

  file {"${path}/${name}":
    ensure => $ensure,
    notify => Exec['fc-cache'],
  }

  if $ensure == 'present' {
    if !$source {
      fail "Must pass source to Fonts::File[${name}]"
    }

    File["${path}/${name}"] {
      source => $source,
    }
  }

}
