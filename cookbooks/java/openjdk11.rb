include_recipe '../def'

tar_url  = 'https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz'
dir_name = 'jdk-11.0.1'
tmp_dir  = '/tmp'
target   = "#{tmp_dir}/openjdk.tar.gz"

curl 'download openjdk' do
  path target
  url  tar_url
end

execute 'tar openjdk' do
  cwd tmp_dir
  command <<-EOT
    tar xvf openjdk.tar.gz --directory /usr/lib/jvm
  EOT
  not_if "test -e /usr/lib/jvm/#{dir_name}"
end

execute 'fixme' do
  command <<-EOT
    sh -c "for bin in /usr/lib/jvm/#{dir_name}/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100; done"
  EOT
end
