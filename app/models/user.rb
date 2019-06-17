class User < ApplicationRecord
	#SECTION: CONSTANT
	NIVEAUX =["Tous","3e", "Tle A","Tle D", "Tle C"]

	#SECTION: RELATIONS
	#has_many :questions, dependent: :destroy
	has_many :course, dependent: :destroy
	#has_many :comments, dependent: :destroy
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
