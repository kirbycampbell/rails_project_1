OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '331635822000-7mng2fve0843u8csu026p7k8456omh5l.apps.googleusercontent.com', '27s77dA-FBneKJEMTPOB1nZM', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
