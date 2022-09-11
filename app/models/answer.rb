# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :user, optional: true

  validates :body, presence: true, length: {minimum: 2}
end
