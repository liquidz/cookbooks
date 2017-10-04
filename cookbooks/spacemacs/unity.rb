template "#{node['home']}/.local/share/applications/spacemacs.desktop" do
  source 'spacemacs.desktop.erb'
  mode '0755'
end
