Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV["86voukkn7q471o"], ENV["qhQmZRz2YXDN8lRj"],
           scope: "r_liteprofile r_emailaddress"
end
