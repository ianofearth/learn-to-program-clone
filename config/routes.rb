Rails.application.routes.draw do
  resources :subjects do
    resources :lessons
  end
end
