%w(
  java/default
  clojure/default
  clojure/joker
).each do |recipe|
  include_recipe "../../cookbooks/#{recipe}.rb"
end
