Airbrake.configure do |config|
  config.api_key     = '1ba48cd7e20bda8804f0d618dd63be04'
  config.host        = 'terriblelabs-errbit.herokuapp.com'
  config.port        = 80
  config.secure      = config.port == 443
end