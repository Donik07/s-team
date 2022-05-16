# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user, optional: true
  has_many :answers, dependent: :destroy
  has_many_attached :question_files, dependent: :destroy

  has_many :users

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
end
