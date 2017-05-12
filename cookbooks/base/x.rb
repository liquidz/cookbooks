%w(
  xorg-x11-apps
  ttf-ancient-fonts
  terminator
).each do |pkg_name|
  package pkg_name
end
