include_recipe '../def'

url    = 'https://github.com/BurntSushi/ripgrep/releases/download/0.5.0/ripgrep-0.5.0-x86_64-unknown-linux-musl.tar.gz'
file   = url.split('/').last
name   = file.gsub('.tar.gz', '')
target = "#{ENV['HOME']}/bin/rg"

curl 'ripgrep' do
  path "/tmp/#{file}"
  url  url
end

execute 'tar and copy' do
  cwd '/tmp'
  command <<-EOT
    tar xvf /tmp/#{file}
    cp /tmp/#{name}/rg #{target}
  EOT
  not_if "test -e #{target}"
end
