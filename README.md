# README **Questionnaire**

### Using:
* Ruby version 3.0.0
* Rails version 6.1.4
* Postgresql

### To setup the application locally:

* In the application root directory create file '.env'. Place to it a line that describe DATABASE_URL. E.g.:
  DATABASE_URL=postgres://user:password@localhost:5432/questionnaire_development

#### In a terminal from the application directory run next commands:
* bundle
* yarn
* rails db:create
* rails db:migrate
