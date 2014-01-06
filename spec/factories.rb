FactoryGirl.define do 
	factory :user do
		name 		 "Peter Liu"
		email 	 "pliu7@binghamton.edu"
		password "foobar"
		password_confirmation "foobar"
	end
end