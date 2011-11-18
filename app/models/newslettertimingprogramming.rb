class Newslettertimingprogramming < ActiveRecord::Base
	validates_presence_of :newsletter_id	
	belongs_to :newsletter
end
