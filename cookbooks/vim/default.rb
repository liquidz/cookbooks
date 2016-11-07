lua_version = '5.1'

#liblua#{lua_version}-dev libluajit-#{lua_version}
%W(
  make gcc git ncurses-dev
  python-dev python3-dev
).each do |pkg_name|
  package pkg_name
end

package 'vim' do
  action :remove
end

#link '/usr/include/lua' do
#  #to "/usr/include/lua#{lua_version}"
#  to '/usr/include/luajit-2.0'
#end
#  --enable-luainterp=dynamic
#  --with-luajit

src_dir = '/usr/local/src/vim'
configure_option = %W(
  --prefix=/usr/local
  --with-features=huge
  --enable-multibyte
  --enable-pythoninterp
  --enable-fail-if-missing
).join(' ')

git src_dir do
  repository 'https://github.com/vim/vim'
end

execute 'configure' do
  cwd '/usr/local/src/vim'
  command "./configure #{configure_option}"
  not_if 'test -e src/auto/config.log'
end

execute 'make and make install' do
  cwd '/usr/local/src/vim'
  command 'make && make install'
  not_if 'test -e /usr/local/bin/vim'
end

template '/usr/local/src/vim/rebuild.sh' do
  source 'rebuild.sh.erb'
  mode '0755'
  variables(configure: configure_option)
end
