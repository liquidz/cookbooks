%w(
  docker.io
  docker-compose
).each do |pkg_name|
  package pkg_name
end
