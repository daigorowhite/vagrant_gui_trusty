# xubuntu
%w{xubuntu-desktop xdg-utils xfce4-terminal firefox xubuntu-icon-theme geany}.each do |pkg|
	apt_package pkg do
		options "--no-install-recommends"
	end
end

#Auto login
# execute "/usr/lib/lightdm/lightdm-set-defaults -l false"
cookbook_file "/etc/lightdm/lightdm.conf" do
	source "xubuntu/lightdm.conf"
	mode 0644
end

package "ibus-mozc"

execute "Set timezone" do
	command <<-EOF
	echo Asia/Tokyo > /etc/timezone
	dpkg-reconfigure --frontend noninteractive tzdata
	EOF
	not_if "grep 'Asia/Tokyo' /etc/timezone"
end

cookbook_file "/home/vagrant/.xprofile" do
	source "xubuntu/.xprofile"
	owner "vagrant"
	group "vagrant"
	mode 0644
end	