include_recipe '../yarn/default'

execute 'install shadow-cljs' do
  command 'yarn global add shadow-cljs'
  not_if 'which shadow-cljs'
end
