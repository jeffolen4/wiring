class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  helper :all
  protect_from_forgery
  #layout :detect_browser

  private

  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  UA_RULES = [
    ['iPhone;', 'phone'],
    ['iPad;', 'tablet'],
    ['Android.*Mobile Safari', 'phone'],  # Chrome/Browser on Android phone
    ['Android.*Safari', 'tablet'],        # Chrome/Browser on Android tablet
    ['.*', 'desktop'],                    # Fallback to desktop.
  ]

  def detect_browser
    agent = request.user_agent.downcase
    #agent = request.headers["HTTP_USER_AGENT"].downcase
    UA_RULES.each do |m|
      return m[1] if agent.match(m[0])
    end
    return "desktop"
  end
end
