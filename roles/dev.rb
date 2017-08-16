%w(
  sudoers/default
  base/default
  tmux/default
  zsh/default
  neovim/default
  java/default
  skim/default
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
