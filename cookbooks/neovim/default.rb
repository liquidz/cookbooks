include_recipe '../python/pip3.rb'
include_recipe '../def'

version = '0.3.1'
package 'software-properties-common'

curl 'nvim.appimage' do
  path '/usr/local/bin/nvim'
  url "https://github.com/neovim/neovim/releases/download/v#{version}/nvim.appimage"
end

# execute 'add repository' do
#   command <<-EOC
#     add-apt-repository -y -u ppa:neovim-ppa/stable
#     apt-get install neovim
#   EOC
# end

execute 'install neovim' do
  command 'pip3 install neovim'
end

# to upgrade
# $ pip3 install neovim -U
