%w(
  tetex-*
  texlive
  texlive-lang-cjk
  xdvik-ja
).each do |pkg_name|
  package pkg_name
end
