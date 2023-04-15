Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "86voukkn7q471o", "qhQmZRz2YXDN8lRj", scope: "r_liteprofile r_emailaddress"
end
