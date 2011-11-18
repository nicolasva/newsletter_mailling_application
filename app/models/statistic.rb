class Statistic < ActiveRecord::Base
	attr_accessible :ip, :localization, :newsletter_id
	belongs_to :newsletter
	validates_presence_of :ip
	validates_presence_of :localization
	validates_presence_of :newsletter_id
	validates_uniqueness_of :ip, :scope => :newsletter_id

	def self.save_statistic(newsletter_hash)
		statistic = Statistic.new(newsletter_hash[:newsletter])
                statistic.save
	end
end
