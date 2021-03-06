class Portfolio < ApplicationRecord
  acts_as_list

  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                  allow_destroy: true,
  								reject_if: lambda { |attrs| attrs['name'].blank? }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :subtitle, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
  	where(subtitle: "Angular")
  end 

  def self.by_postion
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, ->{ where(subtitle: "Ruby on Rails") }

end



