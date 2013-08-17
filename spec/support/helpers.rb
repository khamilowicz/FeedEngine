require "spec_helper"

def url_for_subdomain subdomain="www", path="/"
 # "http://#{subdomain}.lvh.me:#{Capybara.server_port}#{path}"
 "/#{subdomain}"
end