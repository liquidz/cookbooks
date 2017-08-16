include_recipe '../def'

version = '1.6.0'
bin_dir = "/home/#{node[:user]}/bin"

curl 'lumo' do
  path '/tmp/lumo.zip'
  url  "https://github.com/anmonteiro/lumo/releases/download/#{version}/lumo_linux64.zip"
end

directory bin_dir do
  owner node[:user]
  group node[:group]
end

execute 'unzip' do
  cwd bin_dir
  command 'unzip /tmp/lumo.zip'
  not_if "test -e #{bin_dir}/lumo"
end

file "#{bin_dir}/lumo" do
  owner node[:user]
  group node[:group]
end
