# Raye7 facebook application id and secret key and the data taken from facebook.

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

    provider :facebook, '716016431848330', '2ca26a95b3eaf85141826fba125d365e', {:scope => 'user_friends, email, public_profile',:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end