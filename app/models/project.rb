# frozen_string_literal: true
#
class Project < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :project_name, presence: true
end
