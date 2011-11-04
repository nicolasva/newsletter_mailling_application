class Mail < ActiveRecord::Base
	has_and_belongs_to_many :subcontacts
	has_and_belongs_to_many :newsletters
        validates_presence_of :email
	accepts_nested_attributes_for :subcontacts
	attr_accessible :name, :adress, :cppostal, :tel, :email

	def self.position(index,id)
		update_all(['position=?', index], ['id=?', id])
	end
end
