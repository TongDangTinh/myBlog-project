Rails.application.routes.draw do
  root "pages#about"
  mount Ckeditor::Engine => "/ckeditor"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
