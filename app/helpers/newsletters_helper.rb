module NewslettersHelper
	def form_date_select?(f,flash_newsletter)
		if flash_newsletter.nil? || flash_newsletter["created_at(1i)"].empty? 
			f.date_select(:created_at, :limit=>[:day, :month, :year], :prompt => { :day => "Select day", :month => "Select month", :year => "Select year" })
		else
			f.date_select(:created_at, :limit=>[:day, :month, :year], :default => { :day =>flash_newsletter["created_at(3i)"].to_i, :month =>flash_newsletter["created_at(2i)"].to_i, :year =>flash_newsletter["created_at(1i)"].to_i })
		end
	end

	def newsletters_lists(newsletters)
		unless newsletters.empty?	
			newsletters_lists = "<table cellpadding='0' border='0' cellspacing='0'>
  				<tr class='tr_class_title'>
   					<td class='td_class_title' id='id_td_title_newsletter' width='450'>#{label_tag(Newsletter.human_attribute_name("name"))}</td>
    					<td class='td_class_title_edition'>#{label_tag(t("common_link.show"))}</td>
    					<td class='td_class_title_edition'>#{label_tag(t("common_link.editing"))}</td>
    					<td class='td_class_title_edition_last'>#{label_tag(t("common_link.removal"))}</td>
  				</tr>"

				newsletters.each do |newsletter|
  				newsletters_lists += "<tr>
    					<td class='td_class_newsletter_name'>#{newsletter.name}</td>
    					<td>#{link_to t(".show_newsletter"), newsletter}</td>
    					<td>#{link_to image_tag(t("common_link.edit"), :size=>"18x18"), edit_newsletter_path(newsletter)}</td>
    					<td class='td_class_last_column'>#{link_to image_tag(t("common_link.delete")), newsletter, :confirm => 'Are you sure?', :method => :delete }</td>
  				</tr>"
				end
			newsletters_lists += "</table>"
		else
			newsletters_lists = "<ul><li>Il n'y a pas de newsletter à cette date</li></ul>"
		end

		return newsletters_lists.html_safe	
	end
end
