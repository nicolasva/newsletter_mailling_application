class Mailstart < ActiveRecord::Base
belongs_to :user
has_many :categoryalls, :dependent => :destroy
has_many :newsletters
accepts_nested_attributes_for :categoryalls
validates_presence_of :mail
validates_presence_of :user_id
attr_accessible :name, :mail, :user_id, :position
	def self.position(index,id)
		#update_all(['position = FIND_IN_SET(id, ?)', ids.join(',')], { :id => ids})
		update_all(['position=?', index], ['id=?', id])
	end
end
