Rails.application.routes.draw do
  resources :emprestimos
  resources :livros
  resources :alunos
  root "bem_vindo#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
