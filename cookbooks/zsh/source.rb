include_recipe '../def'

version = '5.6.2'
src_dir = '/usr/local/src'
zsh_dir = "#{src_dir}/zsh-#{version}"

package 'ncurses-dev'

curl 'download zsh archive' do
  path '/tmp/zsh.tar.xz'
  url "https://sourceforge.net/projects/zsh/files/zsh/#{version}/zsh-#{version}.tar.xz/download"
end

execute 'tar zsh' do
  cwd src_dir
  command <<-EOT
    tar xvf /tmp/zsh.tar.xz
  EOT
  not_if "test -e #{zsh_dir}"
end

execute 'configure' do
  cwd zsh_dir
  command './configure'
  not_if 'test -e config.log'
end

execute 'make and make install' do
  cwd zsh_dir
  command 'make && make install'
  not_if 'test -e /usr/local/bin/zsh'
end

execute 'add to /etc/shells' do
  cwd zsh_dir
  command <<-EOT
    echo '/usr/local/bin/zsh' >> /etc/shells
  EOT
  not_if 'grep /usr/local/bin/zsh /etc/shells'
end
