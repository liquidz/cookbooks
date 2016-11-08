include_recipe 'default'

vim_from_source 'latest' do
    packages %W( make gcc git ncurses ncurses-devel python-devel ctags )
end
