base_dir = "#{ENV['HOME']}/.skim"

git base_dir do
  repository 'https://github.com/lotabout/skim'
end

execute 'install skim' do
  command <<-EOT
    #{base_dir}/install
  EOT
  not_if "test -e #{base_dir}/bin/sk"
end
