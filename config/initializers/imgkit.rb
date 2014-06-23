IMGKit.configure do |config|
  # config.wkhtmltoimage = '/path/to/wkhtmltoimage' Default

  config.default_format = :png
  config.default_options = {
    :quality => 70
  }
end