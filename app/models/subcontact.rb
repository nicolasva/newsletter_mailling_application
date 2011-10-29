class Subcontact < ActiveRecord::Base
	has_and_belongs_to_many :categoryalls
	has_and_belongs_to_many :newsletters
	has_and_belongs_to_many :mails
	accepts_nested_attributes_for :categoryalls, :mails
	validates_presence_of :name
end
