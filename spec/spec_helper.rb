require "simplecov"
SimpleCov.start
require "capybara/rspec"
require "rails_helper"
require "factory_girl_rails"
require "support/factory_girl"

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
  uid: "12354",
  "info" => {
    email: "bob@example.com",
    name: "bob",
    image: "bob.com",
  },
  "credentials" => { token: "more stuff"}
)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.include Capybara::DSL
  config.include Rails.application.routes.url_helpers
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/test_files/"])
  end
end
