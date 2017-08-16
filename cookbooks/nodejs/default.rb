include_recipe '../def'

url   = 'https://nodejs.org/dist/v8.3.0/node-v8.3.0-linux-x64.tar.xz'
file  = url.split('/').last
name  = file.gsub('.tar.xz', '')
local = '/usr/local'

curl 'nodejs' do
  path "/tmp/#{file}"
  url  url
end

execute 'tar nodejs' do
  cwd local
  command <<-EOT
    tar xvf /tmp/#{file}
  EOT
  not_if "test -e #{local}/#{name}"
end

link "#{local}/nodejs" do
  to "#{local}/#{name}"
end
