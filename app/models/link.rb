class Link < ActiveRecord::Base
  validates :url, presence: true
  validates :views, presence: true
end
