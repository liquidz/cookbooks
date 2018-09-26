include_recipe '../def'

ver    = '0.9.7'
url    = "https://github.com/candid82/joker/releases/download/v#{ver}/joker-#{ver}-linux-amd64.zip"
file   = url.split('/').last
target = "#{ENV['HOME']}/bin/joker"

curl 'joker' do
  path "/tmp/#{file}"
  url  url
end

execute 'unzip and copy' do
  cwd '/tmp'
  command <<-EOT
    unzip /tmp/#{file}
    cp /tmp/joker #{target}
  EOT
  not_if "test -e #{target}"
end
