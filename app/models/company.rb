# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :service
  validates :name, presence: true, uniqueness: true
  validates :city, presence: true, length: { in: 2..30 }
  validates :address, presence: true, length: { minimum: 10 }
  validates :email_registration, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :email_notification, presence: true, uniqueness: true, 'valid_email_2/email': true
  validates :password, length: { minimum: 8 }
  validates :phone, uniqueness: true, presence: true, numericality: { only_integer: true }, length: { is: 11 }

  has_secure_password

  belongs_to :district

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end
end
