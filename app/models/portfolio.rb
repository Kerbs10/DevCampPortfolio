class Portfolio < ApplicationRecord
  acts_as_list

  include Placeholder

  has_many :technologies
  accepts_nested_attributes_for :technologies, 
  								reject_if: lambda { |attrs| attrs['name'].blank? }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
  	where(subtitle: "Angular")
  end 

  def self.by_postion
    order("position ASC")
  end


  scope :ruby_on_rails_portfolio_items, ->{ where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
  	self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
  	self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
