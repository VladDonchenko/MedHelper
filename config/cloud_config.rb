Cloudinary.config do |c|
  c.api_key: <%= ENV.fetch("KEY") %>
  c.secret_key: <%= ENV.fetch("SECRET") %>
end
