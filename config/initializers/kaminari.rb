Kaminari.configure do |config|
  if Rails.env.test?
    config.default_per_page = 2
  end
end