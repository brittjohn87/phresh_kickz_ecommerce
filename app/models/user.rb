class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shoes
  has_many :orders
  validates :role, presence: true

  def admin?
  	role == 'admin'
  end

  def buyer?
  	role == 'guest'
  end

  def seller?
    role == 'seller'
  end
end


