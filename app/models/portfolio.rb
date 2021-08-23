class Portfolio < ApplicationRecord
	extend FriendlyId
  	friendly_id :title, use: :slugged

  	validates_presence_of :title, :body, :main_image, :thumb_image

  	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  	def self.angular
  		where(subtitle: 'Angular')
  	end
end
