Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "8634q6lbvzafdt", "MkGEB8ptUUHi7zog", scope: "r_liteprofile r_emailaddress"
end
