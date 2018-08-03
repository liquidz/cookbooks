include_recipe '../python/pip3.rb'

package 'software-properties-common'

execute 'add repository' do
  command <<-EOC
    add-apt-repository -y -u ppa:neovim-ppa/stable
    apt-get install neovim
  EOC
end

execute 'install neovim' do
  command 'pip3 install neovim'
end

# to upgrade
# $ pip3 install neovim -U
