require 'spec_helper'

describe Micropost do
	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(content: "Lorem ipsum") }

	# before do
		# This code is not idiomatically correct
		# @micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
	# end

	subject { @micropost }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should eq user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }		
	end
end
