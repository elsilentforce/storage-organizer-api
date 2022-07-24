class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true

  def generate_jwt
    JWT.encode(
      {
        id: self.id,
        exp: 30.days.from_now.to_i
      },
      Rails.application.secrets.secret_key_base.to_s
    )
  end
end
