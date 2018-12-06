class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    protect_from_forgery prepend: true
    
    config.time_zone = 'Eastern Time (US & Canada)'
end
