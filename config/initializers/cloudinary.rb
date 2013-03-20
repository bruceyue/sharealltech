Cloudinary.config do |config|
  config.cloud_name = 'sharealltech'
  config.api_key = ENV['CD_KEY']
  config.api_secret = ENV['CD_SECRET']
  config.cdn_subdomain = true
end