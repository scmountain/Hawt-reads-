class Link < ActiveRecord::Base
  validates :url, presence: true

  def self.top_ten
    all.order('views DESC')
    .limit(10)
  end

  def is_hot
    top_ten[0]
  end
end