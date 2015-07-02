  $base_packages = [
    "automake",
    "bison",
    "doxygen",
    "ethtool",
    "flex",
    "g++",
    "ipython",
    "ipython-notebook",
    "libany-moose-perl",
    "libboost-dev",
    "libboost-filesystem-dev",
    "libboost-program-options-dev",
    "libboost-system-dev",
    "libboost-test-dev",
    "libbsd-dev",
    "libedit-dev",
    "libevent-dev",
    "libfreetype6-dev",
    "libhiredis-dev",
    "libjudy-dev",
    "libpcap-dev",
    "libpng-dev",
    "libssl-dev",
    "libtool",
    "libyaml-0-2",
    "libbz2-dev",
    "mininet",
    "openssl",
    "pkg-config",
    "python-dev",
    "python-dpkt",
    "python-jsonpickle",
    "python-imaging-tk",
    "python-matplotlib",
    "python-nose",
    "python-numpy",
    "python-pandas",
    "python-pip",
    "python-pygraph",
    "python-pygraphviz",
    "python-scipy",
    "python-setuptools",
    "python-sympy",
    "python-yaml",
    "redis-server",
    "thrift-compiler",
    "wireshark",
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
    creates => "/p4/p4factory/install.sh",
  }

  file { [
           "/p4/p4factory",
         ]:
    ensure => directory,
  }

  exec { "installp4factory":
    command => "sh /p4/p4factory/install.sh",
    cwd     => "/p4/p4factory",
    path    => ["/bin", "/usr/bin"],
  }
