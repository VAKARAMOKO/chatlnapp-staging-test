class User < ApplicationRecord
	#CONSTANT
	NIVEAUX =["Tous","3e", "Tle A","Tle D", "Tle C"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
