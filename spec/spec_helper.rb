require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
  #unless ENV['DRB']
  #  require 'simplecov'
  #  SimpleCov.start 'rails'
  #end

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
	require 'shoulda'
  require "shoulda-matchers"
  require 'factory_girl'
  require 'ffaker'
  require 'date'
  require 'time'
  require 'ruby-debug'


  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  begin
    Dir[('factories/*.rb')].each {|f| require f }
  rescue Factory::DuplicateDefinitionError
    nil
  end

  #Don't enable RackTest yet
  Capybara.register_driver :rack_test do |app|
    Capybara::RackTest::Driver.new(app, :browser => :chrome)
  end

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

		config.include Capybara::DSL

		config.before(:suite) do
		  DatabaseCleaner.strategy = :transaction
		  DatabaseCleaner.clean_with(:truncation)
		end

		config.before(:each) do
		  DatabaseCleaner.start
		end

		config.after(:each) do
		  DatabaseCleaner.clean
		end
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  #Load all factories and report if there is duplicate definition
  #if ENV['DRB']
  #  require 'simplecov'
  #  SimpleCov.start 'rails'
  #end

	# reload all the models
  Dir["#{Rails.root}/app/models/**/*.rb"].each do |model|
    load model
  end
	# reload all the controllers
  Dir["#{Rails.root}/app/controllers/**/*.rb"].each do |controller|
    load controller
  end

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  begin
    Dir[('factories/*.rb')].each {|f| require f }
  rescue Factory::DuplicateDefinitionError
    nil
  end

end
