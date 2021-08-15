Rails.application.routes.draw do
  root 'quizzes#index'

  resources :quizzes, param: :slug, only: %i[index show] do
    member do
      get ':uid/steps/:step_position', to: 'steps#show_questions'
      post ':uid/steps/:step_position', to: 'steps#save_answers'
      get 'completed'
    end
  end
end
