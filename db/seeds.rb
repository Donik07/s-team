# frozen_string_literal: true

# 10.times do
#   title = Faker::Hipster.sentence(word_count: 3)
#   body = Faker::Hipster.paragraph(sentence_count: 4)
#   user_id = 3
#   users_id = 4
#   Question.create title: title, body: body, user_id: user_id, users_id:users_id
# end
#
Status.create status: 'Открыта'
Status.create status: 'В работе'
Status.create status: 'Готово'
Status.create status: 'Архив'
