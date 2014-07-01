require "spec_helper"

feature "Homepage" do
  scenario "should have a greeting" do
    visit "/"

    expect(page).to have_content("RSVP App")
  end

  scenario "user can click RSVP link" do
    visit "/"
    click_on "RSVP"
    choose "Fish"
    expect(page).to have_content("New RSVP")
  end

  scenario "user fills out forms" do
    visit "/rsvps/new"

    fill_in "Name", with: "Luke Bartel"
    fill_in "Email", with: "lukebartel@email.com"
    select "1", from: "Number of Guests"

  end

  scenario "user submits RSVP with RSVP button" do
    visit "/rsvps/new"

    click_on "RSVP"

    expect(page).to have_content("Thanks for RSVPing!")

  end

end