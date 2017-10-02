include_recipe '../def'

version  = '0.8.2'
bin_dir  = "#{node[:home]}/bin"
zip_file = "/tmp/joker.zip"
target   = "#{bin_dir}/joker"

directory bin_dir do
  owner node[:user]
  group node[:group]
end

curl 'joker.zip' do
  path zip_file
  url  "https://github.com/candid82/joker/releases/download/v#{version}/joker-#{version}-linux-amd64.zip"
end

execute 'unzip joker' do
  cwd bin_dir
  command "unzip #{zip_file}"
  not_if "test -e #{target}"
end

file "#{bin_dir}/joker" do
  mode '0755'
  owner node[:user]
  group node[:group]
end
