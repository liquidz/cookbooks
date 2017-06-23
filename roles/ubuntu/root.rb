%w(
  base/default
  tmux/default
  vim/ubuntu
  zsh/default
  java/default
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
