class User < ApplicationRecord
	#SECTION: CONSTANT
	NIVEAUX =["Tous","3e", "Tle A","Tle D", "Tle C"]

	#SECTION: RELATIONS
	#has_many :questions, dependent: :destroy
	has_many :course, dependent: :destroy
	#has_many :comments, dependent: :destroy
	
	# # devise extention setting
	validates :number_mobile, presence: :true, uniqueness: { case_sensitive: false }
	validates :username, presence: :true, uniqueness: { case_sensitive: false }

	validate :validate_username# dans le cas de Nom_Complet: type{email =! mobile_number jamais}

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end
	attr_writer :login

	def login
	  @login || self.username || self.email
	end
	  

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
