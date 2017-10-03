%w( emacs25 xsel).each do |pkg_name|
  package pkg_name
end

git "#{node[:home]}/.emacs.d" do
  repository 'https://github.com/syl20bnr/spacemacs'
end
