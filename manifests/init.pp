import "defines/*.pp"

class rvm($src_dir = "/usr/local/src") {

	exec { 'rvm_download' :
	    command =>"wget get.rvm.io -O ${src_dir}/rvm-installer",
	    creates => "${src_dir}/rvm-installer",
	    notify => File["rvm-installer"]
	}

	file { 'rvm-installer' : 
	    path => "${src_dir}/rvm-installer",
	    mode => 755,
	}
}