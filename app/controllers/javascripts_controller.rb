class JavascriptsController < ApplicationController
	respond_to :html, :json
	def categoryalls_lists
		#render :text=>params[:mailstart_id]
		@categoryalls = Categoryall.where(:mailstart_id => params[:mailstart_id].to_i)
	end

	def subcontacts_lists
		#@subcontacts = Subcontact.where(:categoryall_id => params[:categoryall_id].to_i)
		@categoryall = Categoryall.find(params[:categoryall_id].to_i)
	end

	def mails_lists
		@subcontact = Subcontact.find(params[:subcontact_id].to_i)
	end
end
