Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      # /tests_passages/:id/result
      get :result
    end
  end
end
