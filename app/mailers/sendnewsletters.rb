class Sendnewsletters < ActionMailer::Base
  default :from => "nicolas.vandenbogaerde@gmail.com"

  def sendnewsletter(newsletter,request_domain)
	mail_bcc = Array.new
	mail_bcc = newsletter.mailadd.gsub(/(;|:|-|_)/, ',').split(",") unless newsletter.mailadd.nil?
	newsletter.emails.each{ |email|
		mail_bcc.push(email.addr_mail) unless mail_bcc.include?(email.addr_mail)
	}
	@newsletter = newsletter
	@domain = request_domain
	mail(:from => newsletter.mailstart.mail, :bcc => mail_bcc, :subject => newsletter.name) 
  end
end
