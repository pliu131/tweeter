module UsersHelper
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def sign_in(user)
  	remember_token = User.new_remember_token
  	cookies.permanent[:remember_token] = remember_token
  	user.update_attribute(:remember_token, User.encrypt(remember_token))
  	self.current_user = user
  end
end
