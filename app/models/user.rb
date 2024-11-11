class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :courses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: { teacher: 0,student: 1}
         def teacher?
           role=="teacher"
         end
         def student?
           role=="student"
           end
end
