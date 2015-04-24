define fonts::files(
  $ensure = present,
  $source = undef,
  $path   = '/usr/local/share/fonts'
) {
  include ::fonts

  if $ensure == 'present' and !$source {
    fail "Must pass source to Fonts::Files[${name}]"
  }

  $_ensure = $ensure ? { 'present' => 'directory', default => $ensure }

  file {"${path}/${name}":
    ensure  => $_ensure,
    source  => $source,
    recurse => true,
    notify  => Exec['fc-cache'],
  }
}
