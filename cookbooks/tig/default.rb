src_dir = '/usr/local/src/tig'
prefix  = '/usr/local'

%w(
  git build-essential libncursesw5-dev
).each do |pkg_name|
  package pkg_name
end

git src_dir do
  repository 'https://github.com/jonas/tig'
end

execute 'build tig' do
  cwd src_dir
  command <<-EOT
    ./autogen.sh
    LDLIBS=-lncursesw CFLAGS=-I/usr/include/ncursesw ./configure
    make
    make install
  EOT
  not_if 'test -e /usr/local/bin/tig'
end
