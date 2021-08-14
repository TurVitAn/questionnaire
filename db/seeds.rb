require 'ffaker'

QUIZZES = {
  english: 'Test your English',
  eligibility: 'Your eligibility'
}.freeze

QUIZZES.each { |slug, quiz| Quiz.create(name: quiz, slug: slug) } unless Quiz.exists?

unless Step.exists?
  3.times do |step|
    Step.create(quiz_id: step, position: step)
  end
end

unless Question.exists?
  25.times do |position|
    Question.create(step_id: rand(1..2), position: position + 1, value: FFaker::Lorem.sentence(4),
                    answer_type: rand(0..3))
  end
end

unless PossibleAnswer.exists?
  100.times do |position|
    PossibleAnswer.create(question_id: rand(1..25), position: position + 1, value: FFaker::Lorem.words(3))
  end
end
