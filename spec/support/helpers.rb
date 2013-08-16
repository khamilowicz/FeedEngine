require "spec_helper"

def url_for_subdomain subdomain="www", path="/"
 "http://#{subdomain}.xip.io:#{Capybara.server_port}#{path}"
end