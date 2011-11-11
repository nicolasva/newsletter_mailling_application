class Sendnewsletters < ActionMailer::Base
  default :from => "nicolas.vandenbogaerde@gmail.com"

  def sendnewsletter(from,newsletter)
	mail_bcc = Array.new
	mail_bcc = newsletter.mailadd.gsub(/(;|:|-|_)/, ',').split(",")
	newsletter.emails.each{ |email|
		mail_bcc.push(email.addr_mail)
	}
	@newsletter = newsletter
	mail(:from => from, :bcc => mail_bcc, :subject => newsletter.name) 
  end
end
