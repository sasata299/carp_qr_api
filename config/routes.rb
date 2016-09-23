Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :score_reports, only: [:index, :update], defaults: { format: 'json' }
  get 'score_reports/:date', to: 'score_reports#date', defaults: { format: 'json' }
  put 'result/:date', to: 'score_reports#update_result', defaults: { format: 'json' }
end
