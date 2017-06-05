require "rails_helper"

RSpec.describe "As guest user" do
  scenario "I can see all links" do

    link1 = Link.create( url: "http://google.com", views: 9)
    link2 = Link.create( url: "http://msn.com", views: 1)

    visit root_path

    expect(page).to have_content(link1.title)
    expect(page).to have_content(link1.price)
    expect(page).to have_content(link2.title)
    expect(page).to have_content(link2.price)

  end
end
