class Email < ActiveRecord::Base
	attr_accessor :copy_cut_mail, :subcontact_id_source
	has_and_belongs_to_many :subcontacts
	has_and_belongs_to_many :newsletters
        validates_presence_of :addr_email
	accepts_nested_attributes_for :subcontacts
	attr_accessible :name, :adress, :cppostal, :tel, :addr_email
	validates_uniqueness_of :addr_email

	def self.position(index,id)
		update_all(['position=?', index], ['id=?', id])
	end
end
