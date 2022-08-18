class ApplicationController < ActionController::Base
  # ***** 以下を追加 *****
  before_action :authenticate_user!
  # ***** 以上を追加 *****

end
