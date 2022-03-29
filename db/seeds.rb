14.times do
  title = Faker::Hipster.sentence(word_count: 3)
  body = Faker::Hipster.paragraph(sentence_count: 4)
  Question.create title: title, body: body
end