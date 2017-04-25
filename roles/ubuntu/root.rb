%w(
  tmux/default
  vim/ubuntu
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
