class Mail < ActiveRecord::Base
	has_and_belongs_to_many :subcontacts
	has_and_belongs_to_many :newsletters
        validates_presence_of :email
	accepts_nested_attributes_for :subcontacts
end
