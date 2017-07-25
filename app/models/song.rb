

class Song < ActiveRecord::Base

	validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
	validates :release_year, numericality: { only_integer: true , less_than_or_equal_to: Time.now.year }, presence: true, if: :release_year_true
	validates :released, inclusion: {in: [true, false]}
	validates :artist_name, presence: true 

	def release_year_true
		released == true 
	end 

end



