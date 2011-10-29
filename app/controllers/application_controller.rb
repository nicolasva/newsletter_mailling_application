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
		      mail_id = params.split("_")[params.split("_").length-1] 
		      subcontact_id = params.split("_")[0].split("-")[0]
		      categoryall_id = params.split("_")[0].split("-")[1]
		      cookies[:categoryall_id] = categoryall_id 
		      cookies[:subcontact_id] = subcontact_id
		      mail = Mail.find(mail_id)
		      redirect_to edit_mail_path(mail)
		     when "supmail"
		      mail_id = params.split("_")[params.split("_").length-1]
		      mail = Mail.find(mail_id)
		      mail.destroy
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
end
