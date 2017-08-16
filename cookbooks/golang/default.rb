include_recipe '../def'

version = '1.8.3'
local   = '/usr/local'

curl 'golang' do
  path "/tmp/go.tar.gz"
  url  "https://storage.googleapis.com/golang/go#{version}.linux-amd64.tar.gz"
end

execute 'tar golang' do
  cwd local
  command <<-EOT
    tar xvf /tmp/go.tar.gz
  EOT
  not_if "test -e #{local}/go"
end
