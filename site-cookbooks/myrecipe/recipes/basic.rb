# git 
package "git"

package "maven"

%w{curl tree libwebkitgtk-1.0-0}.each do |pkg|
	package pkg
end