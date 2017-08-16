%w(
  roswell/default
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
