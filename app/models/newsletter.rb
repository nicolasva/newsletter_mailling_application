class Newsletter < ActiveRecord::Base
	attr_accessor :date_specification, :created_on
	attr_accessible :name, :mailadd, :content, :subcontact_ids, :email_ids, :mailstart_id, :categoryall_id, :date_specification, :created_on, :created_at, :timeractivate
	#attr_accessor :categoryall_id, :subcontact_id
	has_many :statistics
	has_many :newslettertimingprogrammings
	has_and_belongs_to_many :emails
	has_and_belongs_to_many :subcontacts
	belongs_to :mailstart
	belongs_to :categoryall
	validates_presence_of :name
	validates_presence_of :content
	validates_presence_of :mailstart_id
	validates_presence_of :categoryall_id
	#accepts_nested_attributes_for :mailstart
	#accepts_nested_attributes_for :categoryall
	
	scope :autocomplete_newsletter_name, lambda{ |name| {:conditions => ["newsletters.name LIKE ?", "%#{name}%"]}}

	def self.updatetat(newsletter_id)
		newsletter = Newsletter.find(newsletter_id)
		cptstatistic = newsletter.cptstatistic.nil? ? 1 : newsletter.cptstatistic.to_i + 1
		newsletter.update_attribute("cptstatistic", cptstatistic)
	end

	def self.check_programming_newsletter
		time_now = Time.now
		time_min = time_now - 240 
		newsletters = Newsletter.joins(:newslettertimingprogrammings).where(:timeractivate=>true, :newslettertimingprogrammings => {:programmertimer=>time_min..time_now})
		newsletters.each{ |newsletter|
		    newsletter.newslettertimingprogrammings.each{ |newslettertimingprogramming|					Sendnewsletters.sendnewsletter(newslettertimingprogramming.newsletter,request.domain).deliver		
		    }
		}
	end
end
