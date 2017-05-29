%w(
  git build-essential automake libcurl4-openssl-dev
  hyperspec
).each do |pkg_name|
  package pkg_name
end

git '/usr/local/src/roswell' do
  repository 'https://github.com/roswell/roswell'
end

execute 'build roswell' do
  cwd '/usr/local/src/roswell'
  command <<-EOT
    sh bootstrap
    ./configure
    make
    make install
  EOT
end
