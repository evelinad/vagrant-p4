  $base_packages = [
    "git"
  ]

  package { $base_packages:
    ensure => installed,
  }

  notice("Dependencies are ready!")