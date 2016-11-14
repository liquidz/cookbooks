defaults = {
  packages: %W( build-essential git ncurses-dev python-dev python3-dev ),
  src_dir: '/usr/local/src/vim',
  configure: %W( --prefix=/usr/local
                 --with-features=huge
                 --enable-multibyte
                 --enable-pythoninterp
                 --enable-fail-if-missing).join(' '),
}

define :vim_from_source, defaults do
  package 'vim' do
    action :remove
  end
  params[:packages].each do |pkg_name|
    package pkg_name
  end

  git params[:src_dir] do
    repository 'https://github.com/vim/vim'
  end

  execute 'configure' do
    cwd params[:src_dir]
    command "./configure #{params[:configure]}"
    not_if 'test -e src/auto/config.log'
  end

  execute 'make and make install' do
    cwd params[:src_dir]
    command 'make && make install'
    not_if 'test -e /usr/local/bin/vim'
  end

  template '/usr/local/src/vim/rebuild.sh' do
    source 'rebuild.sh.erb'
    mode '0755'
    variables(defaults)
  end
end
