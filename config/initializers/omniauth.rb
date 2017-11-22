OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1048168795337-mgqk2lhb22gnp5ihs6e6aqum4oe6ip5i.apps.googleusercontent.com', 'h-mq8vwhOJgeITazjVHQUNd-', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end