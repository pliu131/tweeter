require "spec_helper"

describe Notifier do
  describe 'welcome' do
  	let(:user) { FactoryGirl.create(:user) }
  	let(:mail) { Notifier.welcome(user) }

  	# ensure that the subject is correct
  	it 'should render the subject' do
  		mail.subject.should eq 'Welcome to My Sample App'
  	end

  	it "should send it to the correct user" do
  		mail.to.should eq [user.email]
  	end

  	it "should be sent from the correct user" do
  		mail.from.should eq ["admin@example.com"]
  	end

  	it "should contain the user's profile page" do
  		mail.should have_link('your profile', href: user_path(user))
  	end

  	it "should contain the user's name" do
  		mail.should have_content(user.name)
  	end
  end
end
