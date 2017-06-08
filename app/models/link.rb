class Link < ActiveRecord::Base
  validates :url, presence: true

  def self.top_ten
      Link.where('updated_at >= ?', 1.day.ago)
      .order('views desc')
      .limit(10)
    end

    def self.top_link
      Link.where('updated_at >= ?', 1.day.ago)
      .order('views desc')
      .limit(1)
    end
end
