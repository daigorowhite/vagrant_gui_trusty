# change apt repository
execute "change apt-repository" do
	cwd "/etc/apt/"
	command <<-EOF
	 sed -i -e 's/http:¥¥/¥¥/us.archive.utunbu.com¥¥/ubuntu/http:¥¥/¥¥/ftp.riken.jp¥¥/pub¥¥/Linux¥¥/ubuntu/g' sources.list
	 sed -i -e 's/http:¥¥/¥¥/security.archive.utunbu.com¥¥/ubuntu/http:¥¥/¥¥/ftp.riken.jp¥¥/pub¥¥/Linux¥¥/ubuntu/g' sources.list
	 apt-get update
	EOF
	not_if "grep 'ftp.riken.jp' '/etc/apt/sources.list' "
end