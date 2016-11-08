define :zsh_users do
  user params[:name] do
    shell '/bin/zsh'
  end
end

package 'zsh'
