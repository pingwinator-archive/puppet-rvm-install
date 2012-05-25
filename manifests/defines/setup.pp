define rvm::setup(
    $user = $name,
    $src_dir = "/usr/local/src"
) {

exec { rvm_download :
    command =>"wget https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer -O ${src_dir}/rvm-installer",
    creates => "${src_dir}/rvm-installer",
    notify => File["rvm-installer"]
}

file { 'rvm-installer' : 
    path => "${src_dir}/rvm-installer",
    mode => 755,
}

exec { rvm_install:
    command => "sudo -i -u ${user} ${src_dir}/rvm-installer > /home/${user}/.rvm_install.log 2>&1",
    require => Exec["rvm_download"],
    creates => "/home/${user}/.rvm"
}

exec { rvm_shell : 
    command => "echo '[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && . \"$HOME/.rvm/scripts/rvm\" # Load RVM function' >> /home/${user}/.bashrc",
    user => $user,
    unless => "grep '$HOME/.rvm/scripts/rvm' /home/${user}/.bashrc",
    require => Exec["rvm_install"]
}

}