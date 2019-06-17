class Course < ApplicationRecord

	belongs_to :user
	validates :user_id, presence: true	
	#has_many :comments, dependent: :destroy


	 #PROF DE MATIERE XX
 	MATIERES = [ "Histoire","Géographie","Math","Physique", "Chimie","SVT","Français","Anglais","Philosophie","EDHC","Allemand","Espagnol","Entreprenariat","Art-Plastique"]
	NIVEAUX =["Tous","3e", "Tle A","Tle D", "Tle C"]
end
