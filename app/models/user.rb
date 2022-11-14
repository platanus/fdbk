class User < ApplicationRecord
  has_many(
    :providers,
    class_name: 'FeedbackSession',
    foreign_key: 'provider_id',
    dependent: :nullify,
    inverse_of: :provider
  )
  has_many(
    :receivers,
    class_name: 'FeedbackSession',
    foreign_key: 'receiver_id',
    dependent: :nullify,
    inverse_of: :receiver
  )

  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable
  )
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
