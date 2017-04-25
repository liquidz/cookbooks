%w(
  skim/default
  rust/default
).each do |recipe|
  include_recipe "../cookbooks/#{recipe}.rb"
end
