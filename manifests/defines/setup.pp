define rvm::setup(
    $version = '1.14.1',
    $src_dir = "/usr/local/src"
) {

    exec { "rvm_install_${name}" :
        command => "sudo -i -u ${name} bash -l -c '${src_dir}/rvm-installer --version ${version} > /home/${name}/.rvm_install.log'",
        require => Exec["rvm_download"],
        creates => "/home/${name}/.rvm",
        cwd => "/tmp/"
    }

}