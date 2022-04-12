# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, dependent: :destroy

  has_many :question_responsibles, dependent: :destroy
  # has_many :users, through: :question_responsibles

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
end
