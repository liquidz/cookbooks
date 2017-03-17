include_recipe '../def'

url   = 'https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.tar.gz'
file  = url.split('/').last
name  = file.gsub('.tar.gz', '')
local = '/usr/local'

curl 'cmake archive' do
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

link "#{local}/cmake" do
  to "#{local}/#{name}"
end
