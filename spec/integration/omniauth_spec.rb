require "spec_helper"

describe "a user login", type: :feature do
  include Capybara::DSL

  it "login button should lead to Github authentication page" do
    visit root_path

    click_link_or_button("LOGIN")

    expect(User.last.uid).to eq("12354")
    expect(current_path).to eq(jobs_path)
  end
end
