%w(
  skim/default
  clojure/default
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
