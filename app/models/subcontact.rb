class Subcontact < ActiveRecord::Base
	attr_accessor :copy_cut_subcontact, :categoryall_id_source, :subcontact_id_origin 
	attr_accessible :name, :categoryalls_attributes
	has_and_belongs_to_many :categoryalls
	has_and_belongs_to_many :newsletters
	has_and_belongs_to_many :emails
	accepts_nested_attributes_for :categoryalls, :emails
	validates_presence_of :name

	def self.position(index,id)
		update_all(['position=?', index], ['id=?', id])
	end
end
