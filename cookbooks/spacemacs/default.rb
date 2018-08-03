%w(
  emacs25
  xsel
  emacs-mozc
  cmigemo
).each do |pkg_name|
  package pkg_name
end

git "#{node[:home]}/.emacs.d" do
  repository 'https://github.com/syl20bnr/spacemacs'
  user node[:user]
end

git "#{node[:home]}/.emacs.d/private/japanese" do
  repository 'https://github.com/kenjimyzk/spacemacs-japanese'
  user node[:user]
end
