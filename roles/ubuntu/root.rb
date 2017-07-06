%w(
  base/default
  tmux/default
  vim/ubuntu
  zsh/default
  java/default
  roswell/default
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
