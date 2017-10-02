base_dir = "#{node[:home]}/.skim"

git base_dir do
  repository 'https://github.com/lotabout/skim'
end

execute 'install skim' do
  command <<-EOT
    #{base_dir}/install
  EOT
  not_if "test -e #{base_dir}/bin/sk"
end

execute 'chown .skim' do
  command <<-EOT
    chown -R #{node[:user]}:#{node[:group]} #{base_dir}
  EOT
end
