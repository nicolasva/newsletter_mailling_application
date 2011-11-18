module StatisticsHelper
	def trait_statistics(newsletters, newsletters_mails_count_total)
	     unless newsletters_mails_count_total.nil?
			g = Gruff::Pie.new
			g.theme = {
   				:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   				:marker_color => '#898989',
   				:background_colors => 'white'
			}

			g.data("Total", newsletters_mails_count_total.to_f)
			newsletters.each do |newsletter|
				purcent_value = newsletter.statistics.count / newsletters_mails_count_total.to_f
				Rails.logger.info "purcent_value-=-=-=-=-=-=-=-#{purcent_value}"
				g.data(newsletter.name.empty? ? "No name" : newsletter.name, purcent_value)
			end
			g.write("#{Rails.root}/app/assets/images/statistics/statisticnewsletter.png")
			image_tag("statistics/statisticnewsletter.png")
	     else
		result = "<ol class='class_ol_nostatistics'>"
		result += "<li>#{t("newsletters.statistics.no_statistics")}</li>"
		result += "</ol>"

		result.html_safe
	     end
	end

	def look_statistics_by_localization_and_newsletter(hash_newsletter_id)
		compteur = 0
		img_localization_newsletter = ""
		hash_newsletter_id.each do |key, hash_localization_value|
		   newsletter = Newsletter.find(key)
		   count_total_statistics = newsletter.emails.count
	           g = Gruff::Pie.new
		   g.theme = {
   			:colors => %w(#90CB4A #FFC863 #FF6B95 #A993FF),
   			:marker_color => '#898989',
   			:background_colors => 'white'
		   }
		
		   hash_localization_value.each do |key, value|
		   	value_pourcentage = (value * 100/100) / count_total_statistics
    			country = key
			country ||= "No name"
			g.data(country, value)
		   end
		   g.write("#{Rails.root}/app/assets/images/statistics/statisticnewsletter_#{compteur}.png")
		   img_localization_newsletter += "<h3>#{newsletter.name}</h3>#{image_tag("statistics/statisticnewsletter_#{compteur}.png")}"
		   compteur += 1
		end
		img_localization_newsletter.html_safe
	end

	def trait_statistics_by_localization_and_newsletter(statistics_by_localization_and_newsletter)
		#<OrderedHash {["Bretagne", 15]=>2, ["Paris", 14]=>1, ["paris", 15]=>1}>
		hash_newsletter_id = Hash.new
	     unless statistics_by_localization_and_newsletter.nil?
		statistics_by_localization_and_newsletter.each do |key, value|
			newsletter_id = key[1]
			Rails.logger.info "newsletter_id-=-=-=-=-=-=-=-#{newsletter_id}"
			unless hash_newsletter_id.has_key?(newsletter_id)
			      hash_value = Hash.new
			      hash_value[key[0]] = key[1]
			      hash_newsletter_id[newsletter_id] = hash_value 	
			else
			      hash_newsletter_id[newsletter_id][key[0]] = key[1]
			end
		end

		look_statistics_by_localization_and_newsletter(hash_newsletter_id)
	     end
	end
end
