class Categoryall < ActiveRecord::Base
	belongs_to :mailstart
	has_and_belongs_to_many :subcontacts
	has_many :newsletters
	accepts_nested_attributes_for :newsletters, :mailstart, :subcontacts
	validates_presence_of :name
	validates_presence_of :mailstart_id
end
