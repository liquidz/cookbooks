include_recipe '../def'

version = '1.0.0-rc9'
local   = '/usr/local'

curl 'graalvm' do
  path "/tmp/graalvm.tar.gz"
  url "https://github.com/oracle/graal/releases/download/vm-#{version}/graalvm-ce-#{version}-linux-amd64.tar.gz"
end

execute 'tar graalvm' do
  cwd local
  command <<-EOT
    tar xvf /tmp/graalvm.tar.gz
  EOT
  not_if "test -e #{local}/graalvm-ce-#{version}"
end

link "#{local}/graalvm" do
  to "#{local}/graalvm-ce-#{version}"
end
