include_recipe '../def'

bin_dir = "/home/#{node[:user]}/bin"
target = "#{bin_dir}/lein"

directory bin_dir do
  owner node[:user]
  group node[:group]
end

curl 'leiningen' do
  path target
  url  'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein'
end

file target do
  mode '0755'
  owner node[:user]
  group node[:group]
end

