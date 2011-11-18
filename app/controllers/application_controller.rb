class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_language
  before_filter :authenticate_user!

  private
  def set_user_language
  	unless cookies[:language].nil?
		I18n.locale = cookies[:language]
	else
		I18n.locale = current_user.language if current_user
	end
  end

  def set_params(params)
	if params.split("_").length-1 == 2
		case params.split("_")[1]
		     when "register"
		      redirect_to mailstarts_path 
		     when "categoryall"
		      categoryall_id = params.split("_")[params.split("_").length-1]
		      categoryall = Categoryall.find(categoryall_id)
		      redirect_to edit_categoryall_path(categoryall)
		     when "subcontact"
		      subcontact_id = params.split("_")[params.split("_").length-1]
		      cookies[:categoryall_id] = params.split("_")[0]
		      subcontact = Subcontact.find(subcontact_id)
		      redirect_to edit_subcontact_path(subcontact)
		     when "mail"
		      email_id = params.split("_")[params.split("_").length-1] 
		      subcontact_id = params.split("_")[0].split("-")[0]
		      categoryall_id = params.split("_")[0].split("-")[1]
		      cookies[:categoryall_id] = categoryall_id 
		      cookies[:subcontact_id] = subcontact_id
		      email = Email.find(email_id)
		      redirect_to edit_email_path(email)
		     when "addmail" 
		      email_id = params.split("_")[params.split("_").length-1] 
		      subcontact_id = params.split("_")[0].split("-")[0]
		      categoryall_id = params.split("_")[0].split("-")[1]
		      cookies[:categoryall_id] = categoryall_id
		      cookies[:subcontact_id] = subcontact_id
		      subcontact = Subcontact.find(subcontact_id)
		      maximum_mail = subcontact.emails.maximum(:id)
		      maximum_mail ||= 0
		      email = subcontact.emails.new(:name=>"mail_#{maximum_mail}", :addr_email=>"adress_#{maximum_mail}@domain.com", :adress=>"adress_#{maximum_mail}", :cppostal=>maximum_mail, :tel=>"tel_#{maximum_mail}")
		      email.save
		      email.subcontacts.push(subcontact)
		      redirect_to edit_email_path(email)
		     when "supmail"
		      email_id = params.split("_")[params.split("_").length-1]
		      email = Email.find(mail_id)
		      email.destroy
		      redirect_to(:back)
		     when "supsubcontact"
		      subcontact_id = params.split("_")[params.split("_").length-1]
		      subcontact = Subcontact.find(subcontact_id)
	 	      subcontact.destroy
		      redirect_to(:back)
		     when "supcategoryall"
		      categoryall_id = params.split("_")[params.split("_").length-1]
		      categoryall = Categoryall.find(categoryall_id)
		      categoryall.destroy
		      redirect_to(:back)
		     when "addcategoryall"
		      mailstart_id = params.split("_")[params.split("_").length-1]
		      mailstart = Mailstart.find(mailstart_id)
		      maximum_categoryall = mailstart.categoryalls.maximum(:id)
		      categoryall = mailstart.categoryalls.new(:name=>"categoryall_#{maximum_categoryall}")
		      categoryall.save
		      redirect_to edit_categoryall_path(categoryall)
		     when "addsubcontact"
		      categoryall_id = params.split("_")[params.split("_").length-1]
		      categoryall = Categoryall.find(categoryall_id)
		      maximum_subcontact = categoryall.subcontacts.maximum(:id)
		      maximum_subcontact ||= 0
		      subcontact = categoryall.subcontacts.new(:name=>"subcontact_#{maximum_subcontact}")
		      subcontact.save
		      categoryall.subcontacts.push(subcontact)
		      cookies[:categoryall_id] = categoryall_id 
		      redirect_to edit_subcontact_path(subcontact)
		     else
		      redirect_to mailstarts_path
	 	end

	end
  end

  def newsletter_statistic_with_name_empty(newsletter_hash,request_path)
  	newsletter_with_name_empty(newsletter_hash,request_path)
  end

  def newsletter_with_name_empty(newsletter_hash,request_path)
	       tab_result = Array.new
	       unless newsletter_hash["created_at(1i)"].empty? || newsletter_hash["created_at(2i)"].empty? || newsletter_hash["created_at(3i)"].empty?  
	       		time_params_form_at = Time.local(newsletter_hash["created_at(1i)"].to_i,newsletter_hash["created_at(2i)"].to_i,newsletter_hash["created_at(3i)"].to_i)
			if newsletter_hash[:date_specification]
				time_params_form_on = Time.local(newsletter_hash["created_on(1i)"].to_i,newsletter_hash["created_on(2i)"].to_i,newsletter_hash["created_on(3i)"].to_i)
				if time_params_form_at < time_params_form_on
				     @newsletters = Newsletter.where(:created_at=>time_params_form_at..time_params_form_on)
				     if request_path == "/statistics" || request_path == "/historystatistics"
					@newsletters_sum = Newsletter.where(:created_at=>time_params_form_at..time_params_form_on).sum('cptstatistic')
				     else
					 unless request_path == "/historylistnewsletter"	 
    				             @newsletters_mails_count_total = Newsletter.joins(:emails).where(:created_at => time_params_form_at..time_params_form_on).count
    					     @statistics_by_localization_and_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:created_at => time_params_form_at..time_params_form_on}).group(:localization,:newsletter_id).count
					 end
				     end
				end
			else
			    @newsletters = Newsletter.where(:created_at=>time_params_form_at)
			    if request_path == "/statistics" || request_path == "/historystatistics"
				@newsletters_sum = Newsletter.where(:created_at=>time_params_form_at).sum('cptstatistic')
			    else
				unless request_path == "/historylistnewsletter"
    		  			@newsletters_mails_count_total = Newsletter.joins(:emails).where(:created_at => time_params_form_at).count
    		  			@statistics_by_localization_and_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:created_at => time_params_form_at}).group(:localization,:newsletter_id).count
				end
			    end
			end
	       end
		   tab_result.push(@newsletters)
		 if request_path == "/statistics" || request.path == "/historystatistics"
		   tab_result.push(@newsletters_sum)
		 else
		   unless request_path == "/historylistnewsletter"
		   	tab_result.push(@newsletters_mails_count_total)
			tab_result.push(@statistics_by_localization_and_newsletter)
		   end
		 end 

	       return tab_result
  end

  def newsletter_statistic_with_name_created_at(newsletter_hash,request_path)
  	newsletter_with_name_created_at(newsletter_hash,request_path)
  end

  def newsletter_with_name_created_at(newsletter_hash,request_path)
	  tab_result = Array.new
	  unless newsletter_hash["created_at(1i)"].empty? || newsletter_hash["created_at(2i)"].empty? || newsletter_hash["created_at(3i)"].empty?
		time_params_form_at = Time.local(newsletter_hash["created_at(1i)"].to_i,newsletter_hash["created_at(2i)"].to_i,newsletter_hash["created_at(3i)"].to_i,0,0,0)
	  	if newsletter_hash["date_specification"]
			time_params_form_on = Time.local(newsletter_hash["created_on(1i)"].to_i,newsletter_hash["created_on(2i)"].to_i,newsletter_hash["created_on(3i)"].to_i,0,0,0)
			if time_params_form_at < time_params_form_on
				@newsletters = Newsletter.where(:created_at=>time_params_form_at..time_params_form_on, :name=>newsletter_hash[:name])
			       if request_path == "/statistics" || request_path == "/historystatistics"
				@newsletters_sum = Newsletter.where(:created_at=>time_params_form_at..time_params_form_on, :name=>newsletter_hash[:name]).sum('cptstatistic')
			       else
				   unless request_path == "/historylistnewsletter"
				   	@newsletters_mails_count_total = Newsletter.joins(:emails).where(:created_at => time_params_form_at..time_params_form_on, :name=>newsletter_hash[:name]).count
					@statistics_by_localization_and_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:created_at => time_params_form_at..time_params_form_on, :name=>newsletter_hash[:name]}).group(:localization,:newsletter_id).count
				   end
			       end
			end
		else
			@newsletters = Newsletter.where(:created_at=>time_params_form_at, :name=>newsletter_hash[:name])
		       if request_path == "/statistics" || request_path == "/historystatistics"
			@newsletters_sum = Newsletter.where(:created_at=>time_params_form_at, :name=>newsletter_hash[:name]).sum('cptstatistic')
		       else
			       unless request_path == "/historylistnewsletter"
			       	@newsletters_mails_count_total = Newsletter.joins(:emails).where(:created_at => time_params_form_at, :name=>newsletter_hash[:name]).count
				@statistics_by_localization_and_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:created_at => time_params_form_at, :name=>newsletter_hash[:name]}).group(:localization,:newsletter_id).count
			       end
		       end
		end
	  else
	 		@newsletters = Newsletter.where(:name => newsletter_hash[:name])
		      if request_path == "/statistics" || request_path == "/historystatistics"
			@newsletters_sum = Newsletter.where(:name => newsletter_hash[:name]).sum('cptstatistic')
		      else
			      unless request_path == "/historylistnewsletter"
			      	@newsletters_mails_count_total = Newsletter.joins(:emails).where(:name=>newsletter_hash[:name]).count
				@statistics_by_localization_and_newsletter = Statistic.joins(:newsletter).where(:newsletters => {:name => newsletter_hash[:name]}).group(:localization,:newsletter_id).count
			      end
		      end
	  end
		tab_result.push(@newsletters)
		if request_path == "/statistics" || request_path == "/historystatistics"
			tab_result.push(@newsletters_sum)
		else
			unless request_path == "/historylistnewsletter"
			  tab_result.push(@newsletters_mails_count_total)
			  tab_result.push(@statistics_by_localization_and_newsletter)
			end
		end	

	  return tab_result
  end

  def set_params_newsletter(params)
  	if params.split("_").length-1 == 3
		case params.split("_")[0]
			when "register"
			   flash[:notice] = t("newsletters.create.notice_success") 
    			   redirect_to edit_newsletter_path(@newsletter)
			when "registersend"
			   Sendnewsletters.sendnewsletter(params[:newsletter][:mailstart_id].to_s,@newsletter,request.domain).deliver
			   flash[:notice] = t("newsletters.create.notice_success_sendind")
    			   redirect_to edit_newsletter_path(@newsletter)
			when "modif"
			   flash[:notice] = t("newsletters.update.notice_success") 
			   redirect_to edit_newsletter_path(@newsletter)
			when "modifsend"
			   Sendnewsletters.sendnewsletter(params[:newsletter][:mailstart_id].to_s,@newsletter,request.domain).deliver
			   flash[:notice] = t("newsletters.update.notice_success_sendind")
			   redirect_to edit_newsletter_path(@newsletter)
			when "addwork" 
			   newslettertimingprogramming = @newsletter.newslettertimingprogrammings.new(:programmertimer=>Time.now+86400)
			   newslettertimingprogramming.save
		end
	end
  end
end
