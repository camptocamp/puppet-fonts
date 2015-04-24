class fonts {
  exec { 'fc-cache':
    refreshonly => true,
    path        => $::path,
  }
}
