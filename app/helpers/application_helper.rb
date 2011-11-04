module ApplicationHelper
	def get_flag_french_or_english(language)
		#case language
			#when :en
			#	return link_to(image_tag("languages/francais.png", :size=>"60x40"), {:controller=>"/newsletters", :action=>"language", :id=>"fr"}, :title=>t("languages.french"))
			#when :fr
				#return link_to(image_tag("languages/anglais.png", :size=>"60x40"), {:controller=>"/newsletters", :action=>"language", :id=>"en"}, :title=>t("languages.english"))	
		#end

		return link_to(image_tag(t("languages.image.#{language.to_s}"), :size=>"60x60"), {:controller=>"/newsletters", :action=>"language", :id=>t("languages.id.#{language.to_s}")}, :title=>t("languages.title.#{language.to_s}"))
	end

	def get_menu_link(controller_name_desired,action_name_desired,controller_name,action_name,request_path)
		case controller_name_desired
			when "newsletters"
				unless request_path == "/statistics"
					get_action_name_newsletters(controller_name,action_name,action_name_desired)
				else
					get_action_name_newsletters(controller_name,"statistics",action_name_desired)	
				end
			when "mailstarts"
				get_action_name_mailstarts(controller_name,action_name,action_name_desired)
		end
	end

	private
	def get_title_newsletter(controller_name,action_name)
		hash_controller_name = Hash.new
		hash_controller_name = {"categoryalls" => "mailsarts", "subcontacts" => "mailstarts", "mails" => "mailstarts"}
		controller_name = hash_controller_name[controller_name] if hash_controller_name.include?(controller_name) 
	  	return t("#{controller_name}.#{action_name}.title")	
	end

	def get_action_name_newsletters(controller_name,action_name,action_name_desired)
		case action_name_desired
			when "index"
			   get_link_url_newsletter_index(controller_name,action_name)
			when "new"
			   get_link_url_newsletter_new(controller_name,action_name)
		   	when "statistics"
		           get_link_url_newsletter_statistic(controller_name,action_name)		
		end
	end

	def get_action_name_mailstarts(controller_name,action_name,action_name_desired)
		case action_name_desired
			when "index"
			    get_link_url_mailstart_index(controller_name,action_name)	
	        end
	end

	def get_link_url_newsletter_index(controller_name,action_name)
			return controller_name == "newsletters" && action_name == "index" ? image_tag("newsletter_icones/icon_calendar.png", :size=>"60x60") : link_to(image_tag("newsletter_icones/icon_calendar.png", :size=>"60x60"), newsletters_path, :title => get_title_newsletter("newsletters", "index"))
	end

	def get_link_url_newsletter_new(controller_name,action_name)
			return controller_name == "newsletters" && action_name == "new" ? image_tag("newsletter_icones/send_mail.png", :size=>"60x60") : link_to(image_tag("newsletter_icones/send_mail.png", :size=>"60x60"), new_newsletter_path, :title => get_title_newsletter("newsletters","new"))
	end

	def get_link_url_mailstart_index(controller_name,action_name)
			return controller_name == "mailstarts" && controller.action_name == "index" ? image_tag("newsletter_icones/Address_Book.png", :size=>"60x60") : link_to(image_tag("newsletter_icones/Address_Book.png", :size=>"60x60"), mailstarts_path, :title=>get_title_newsletter("mailstarts","index"))
	end

	def get_link_url_newsletter_statistic(controller_name,action_name)		
		return controller_name == "newsletters" && action_name == "statistics" ? image_tag("newsletter_icones/statistic_icon.jpg", :size=>"60x60") : link_to(image_tag("newsletter_icones/statistic_icon.jpg", :size=>"60x60"), "/statistics", :title=>get_title_newsletter("newsletters","statistics"))
	end

end
