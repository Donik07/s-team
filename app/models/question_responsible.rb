# frozen_string_literal: true

class QuestionResponsible < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :user, optional: true
end
