define :zsh_users do
  user params[:name] do
    shell '/bin/zsh'
  end
end

package 'zsh'

git "#{node[:home]}/src/github.com/seebi/dircolors-solarized" do
  repository 'https://github.com/seebi/dircolors-solarized'
end

link "#{node[:home]}/.dircolors" do
  to "#{node[:home]}/src/github.com/seebi/dircolors-solarized/dircolors.256dark"
end
