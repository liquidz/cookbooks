%w(
  skim/default
  rust/default
  clojure/default
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
