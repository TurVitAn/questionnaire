namespace :import do
  desc 'Import new quiz to database'
  task :quiz, [:file_name] => :environment do |_, args|
    quiz_hash = YAML.load(File.read("data_source/#{args[:file_name]}"))
    steps_hash = quiz_hash.delete('steps')
    quiz = Quiz.create!(quiz_hash)
    steps_hash.each_with_index do |step_hash, step_index|
      step = quiz.steps.create!(position: step_index + 1)
      step_hash['questions'].each_with_index do |question_hash, question_index|
        possible_answers_hash = question_hash.delete('possible_answers') || {}
        question = step.questions.create!(question_hash.merge(position: question_index + 1))
        possible_answers_hash.each_with_index do |possible_answer_hash, possible_answer_index|
          question.possible_answers.create!(possible_answer_hash.merge(position: possible_answer_index + 1))
        end
      end
    end
    puts "Quiz was successfully created."
  rescue StandardError => e
    quiz&.destroy
    puts "Import Error. Quiz was not created."
    puts e.backtrace.join("\n")
    puts "#{e.message} #{e.class}"
  end
end
