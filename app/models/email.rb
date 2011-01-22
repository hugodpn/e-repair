class Email < ActionMailer::Base

  #  #Email padrao
  # def padrao(options = {})
  #
  #	 email = "hugodpn@gmail.com"
  #
  #	 recipients options[:para] || ""
  #	 from options[:from] || email
  #	 subject options[:assunto]  || ""
  #	 reply_to options[:responder] || email
  #	 body :corpo => options[:corpo] || email
  # end




  default_url_options[:host] = "dhpn.com.ar"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Binary Logic Notifier "
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end


end
