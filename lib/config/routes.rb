Rails.application.routes.draw do |map|
  resources :inspected_objects
  namespace :object_inspector do
    resources :processes
  end
end
