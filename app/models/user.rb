# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :old_password, :remember_token

  has_secure_password validations: false

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_responsibles, dependent: :destroy
  has_many :avatars, dependent: :destroy

  validate :password_presence
  validates :password, confirmation: true, allow_blank: true, length: { minimum: 8, maximum: 80 }
  validate :correct_old_password, on: :update

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true

  def remember_me
    self.remember_token = SecureRandom.urlsafe_base64
    update_column :remember_token_digest, digest(remember_token)
  end

  def forget_me
    update_column :remember_token_digest, nil
    self.remember_token = nil
  end

  def remember_token_authenticated?(remember_token)
    return false unless remember_token_digest.present?

    BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
  end

  private

  def digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
end
