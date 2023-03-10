# fix

exec {'replace-A':
  provider  => shell,
  command   => 'sudo sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf',
  before    => Exec['replace-B'],
}

exec {'replace-B':
  provider  => shell,
  command   => 'sudo sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
}
