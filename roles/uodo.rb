%w(
  vim/ubuntu
  zsh/default
  rust/develop
  hub/default
  tmux/default
  skim/default
).each do |recipe|
  include_recipe "../cookbooks/#{recipe}.rb"
end
