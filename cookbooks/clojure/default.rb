include_recipe '../def'

tmp_dir = "/tmp"
target = "#{tmp_dir}/clj-installer"

package 'rlwrap'

curl 'clj installer' do
  path target
  url  'https://download.clojure.org/install/linux-install-1.9.0.381.sh'
end

file target do
  mode '0755'
  owner node[:user]
  group node[:group]
end

execute 'install clj' do
  command target
  not_if 'test -e /usr/local/bin/clj'
end

