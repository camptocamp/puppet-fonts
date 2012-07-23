class fonts {
  exec {'fc-cache':
    refreshonly => true,
  }
}
