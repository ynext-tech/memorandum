class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :shops

         validates :name,           presence: true
         validates :email,          presence: true, uniqueness: true
         validates :password,       presence: true, length: {minimum: 7, maximum: 128}
         validates :prefecture,     presence: true
         validates :city,           presence: true

end
