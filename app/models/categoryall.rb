class Categoryall < ActiveRecord::Base
	attr_accessible :name
	belongs_to :mailstart
	has_and_belongs_to_many :subcontacts
	has_many :newsletters
	accepts_nested_attributes_for :newsletters, :mailstart, :subcontacts
	validates_presence_of :name
	validates_presence_of :mailstart_id

	def self.position(index,id)
		update_all(['position=?', index], ['id=?', id])
	end
end
