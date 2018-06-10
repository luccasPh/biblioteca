Rails.application.routes.draw do
  devise_for :users
  resources :emprestimos
  resources :livros
  resources :alunos
  root "bem_vindo#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
