require "rails_helper"

RSpec.describe Link, type: :model do
  context "validations" do
    it {should validate_presence_of(:url)}
  end

  context "#top_ten" do
    Link.create(url: "http://google.com", views: 1)
    Link.create(url: "http://youtube.com", views: 2)
    Link.create(url: "http://no.com", views: 3)
    Link.create(url: "http://yes.com", views: 4)
    Link.create(url: "http://ign.com", views: 5)
    Link.create(url: "http://espn.com", views: 6)
    Link.create(url: "http://google.com", views: 7)
    Link.create(url: "http://google.com", views: 8)
    Link.create(url: "http://google.com", views: 9)
    Link.create(url: "http://goducks.com", views: 10)

    list = described_class.top_ten
    expect(list.count).to eq(10)
    expect(list[0].url).to eq("http://goducks.com")
    expect(list[-1].url).to eq("http://google.com")
    expect(list[0].count).to eq(15)
    expect(list[-1].count).to eq(2)
  end
end
