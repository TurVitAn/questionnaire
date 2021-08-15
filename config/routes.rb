Rails.application.routes.draw do
  get '/:slug(/:uid/step/:step_id)', to: 'quizzes#show', as: 'quiz_show'
  get '/:slug/:uid/completed', to: 'quizzes#completed', as: 'quiz_completed'

  root 'quizzes#index'
end
