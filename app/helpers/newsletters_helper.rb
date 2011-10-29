module NewslettersHelper
	def form_date_select?(f,flash_newsletter)
		if flash_newsletter.nil? || flash_newsletter["created_at(1i)"].empty? 
			f.date_select(:created_at, :limit=>[:day, :month, :year], :prompt => { :day => "Select day", :month => "Select month", :year => "Select year" })
		else
			f.date_select(:created_at, :limit=>[:day, :month, :year], :default => { :day =>flash_newsletter["created_at(3i)"].to_i, :month =>flash_newsletter["created_at(2i)"].to_i, :year =>flash_newsletter["created_at(1i)"].to_i })
		end
	end
end
