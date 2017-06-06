class Link < ActiveRecord::Base
  validates :url, presence: true

  def self.top_ten
    require "pry"; binding.pry
    all.order('views DESC')
    .limit(10)
  end

  def is_hot
    top_ten[0]
  end
end
