define rvm::setup(
    $user = $name,
    $version = '1.14.1',
    $src_dir = "/usr/local/src"
) {

    exec { "rvm_install_${user}" :
        command => "/bin/bash -l -c '${src_dir}/rvm-installer --version ${version}' > /home/${user}/.rvm_install.log 2>&1",
        require => Exec["rvm_download"],
        creates => "/home/${user}/.rvm",
        provider => "shell",
        user => $user,
        cwd => "/tmp/"
    }

}