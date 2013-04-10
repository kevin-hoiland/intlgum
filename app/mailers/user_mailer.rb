class UserMailer < ActionMailer::Base
  #default from: "notifications@intlgum.com"
  default from: "Intl Gum <notifications@intlgum.com>"
  
  def welcome_email(user)
    @user = user
#    @login_url  = 'http://intlgum.com/users/sign_in'
    @login_url  = new_user_session_url
    @view_self_url  = profile_url(Profile.find_by_user_id(user.id))
    @edit_self_url = edit_profile_url
    mail(to: user.email, subject: 'Welcome to Intl Gum')
  end
  
  def new_billing_email(billing)
    attachments.inline['logo.png'] = File.read(Rails.root.join('app', 'assets', 'images', 'logo_small4.png'))
    @billing = billing
    @list_billings_url = list_billings_url
    mail(to: User.find(billing.user_id).email, subject: 'New Intl Gum Subscription')
  end
   
  def updated_billing_email(billing)
     attachments.inline['logo.png'] = File.read(Rails.root.join('app', 'assets', 'images', 'logo_small4.png'))
     @billing = billing
     @list_billings_url = list_billings_url
     mail(to: User.find(billing.user_id).email, subject: 'Updated Intl Gum Subscription')
  end
  
  def deleted_billing_email(billing)
    if User.exists?(billing.user_id)
      attachments.inline['logo.png'] = File.read(Rails.root.join('app', 'assets', 'images', 'logo_small4.png'))
      @billing = billing
      @list_billings_url = list_billings_url
      mail(to: User.find(billing.user_id).email, subject: 'Updated Intl Gum Subscription')
    end
  end
  
end
