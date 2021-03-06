class Vote < ActiveRecord::Base

  ############  attributes  ############

  attr_accessible :vote, :voter, :voteable
  
  ############  validations  ############
    
  # Comment out the line below to allow multiple votes per user.
  validates_uniqueness_of :voteable_id, :scope => [:voteable_type, :voter_type, :voter_id]
  
  ############  associations  ############
  
  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true

  ############  scopes  ############
  
  scope :for_voter, lambda { |*args| where(["voter_id = ? AND voter_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :for_voteable, lambda { |*args| where(["voteable_id = ? AND voteable_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :recent, lambda { |*args| where(["created_at > ?", (args.first || 2.weeks.ago)]) }
  scope :descending, order("created_at DESC")

end
