module UsersHelper
	 # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def sign_in(user)
  	remember_token = User.new_remember_token
  	cookies.permanent[:remember_token] = remember_token
  	user.update_attribute(:remember_token, User.encrypt(remember_token))
  	self.current_user = user
  end
end
