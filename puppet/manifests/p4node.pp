  $base_packages = [
    "git"
  ]

  package { $base_packages:
    ensure => installed,
  }

  notice("setting up the p4 environment, depending on your environment, this may take a while...")

  exec { "mkworkingdirectory":
    command => "/bin/mkdir /p4",
    cwd     => "/",
  }

  file { [
           "/p4",
         ]:
    ensure => directory,
  }

  exec { "clonep4factory":
    command => "git clone https://github.com/p4lang/p4factory.git",
    cwd     => "/p4",
    path    => ["/bin", "/usr/bin"],
  }

  exec { "installp4factory":
    command => "install.sh",
    cwd     => "/p4/p4factory",
  }