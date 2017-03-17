include_recipe '../def'

url  = 'https://nodejs.org/download/release/latest/node-v7.7.3-linux-x64.tar.gz'
file = url.split('/').last
name = file.gsub('.tar.gz', '')

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
