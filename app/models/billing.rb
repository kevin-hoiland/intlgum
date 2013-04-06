class Billing < ActiveRecord::Base

  attr_accessible :user_id, :subscription_name, :subscription_count, :last_four, :location, :expiry_month, :expiry_year,
                  :bill_first_name, :bill_last_name, :bill_company, :bill_street, :bill_city, :bill_state_province, :bill_postal_code, 
                  :bill_country, :bill_last_name, :ship_first_name, :ship_company, :ship_last_name, :ship_street, :ship_city,
                  :ship_state_province, :ship_postal_code, :ship_country, :subscription_number, as: :admin
  
  # attr_accessible :title, :body
  attr_accessor :cvc, :pan, :terms, :reason, :copy

  validates :subscription_name, :length => { :maximum => 255 }
  validates :ship_first_name, :length => { :maximum => 50 }
  validates :bill_first_name, :length => { :maximum => 50 }, :presence => true, :on => :create
#  validates_presence_of :bill_first_name, :on => [:create]
  validates :ship_last_name, :length => { :maximum => 50 }
  validates :bill_last_name, :length => { :maximum => 50 }, :presence => true, :on => :create
#  validates_presence_of :bill_last_name, :on => [:create]
  validates :ship_company, :length => { :maximum => 50 }
  validates :bill_company, :length => { :maximum => 50 }  ###  MAYBE COMPANY NAME OR FIRST&LAST SHOULD EXIST...
  validates :ship_street, :presence => true, :length => { :maximum => 60 }
  validates :bill_street, :presence => true, :length => { :maximum => 60 }
  validates :ship_city, :presence => true, :length => { :maximum => 40 }
  validates :bill_city, :presence => true, :length => { :maximum => 40 }
  validates :ship_state_province, :presence => true # Need to add authorize.net restriction, max is 2 char...
  validates :bill_state_province, :presence => true # Need to add authorize.net restriction, max is 2 char...
  validates :ship_postal_code, :presence => true, :length => { :maximum => 20 }
  validates :bill_postal_code, :presence => true, :length => { :maximum => 20 }
  validates :ship_country, :presence => true, :length => { :maximum => 60 }
  validates :bill_country, :presence => true, :length => { :maximum => 60 }
  validates :pan, :length => { :in => 13..19 }, :presence => true, :on => :create
#  validates_presence_of :pan, :on => :create
  validates :expiry_month, :presence => true, :on => :create
#  validates_presence_of :expiry_month, :on => :create
 validates :expiry_year, :presence => true, :on => :create
#  validates_presence_of :expiry_year, :on => :create, :on => :create
  validates :cvc, :length => { :in => 3..4 }, :presence => true, :on => :create
#  validates_presence_of :cvc, :on => [:create]  
  validates_acceptance_of :terms, :message => "^Please accept the terms and conditions"  
  
  belongs_to :user

  
  # found this here: http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
  #class CreditCard < ActiveRecord::Base
    # Strip everything but digits, so the user can specify "555 234 34" or
    # "5552-3434" or both will mean "55523434"
  #  before_validation(:on => :create) do
  #    self.number = number.gsub(%r[^0-9]/, "") if attribute_present?("number")
  #  end
  #end
  
  #before_validation(:on => :udpate) do
      #self.pan = pan.gsub(%r[^0-9]/, '') if attribute_present?("pan")
  #    self.pan = pan.gsub("[^0-9]", "") if attribute_present?("pan")
  #end
  
  
#  def expiry_is_date?
#    if !expiry.is_a?(Date)
#      errors.add(:expiry, 'must be a valid date') 
#    end
#  end

  
end
