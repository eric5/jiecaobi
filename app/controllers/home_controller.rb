class HomeController < ApplicationController

  MONTHLY_JCB_NUMBER = 10

  def index
    @reputations = Reputation.order(created_at: :desc).page(params[:page])
    @jcb_left_this_month = MONTHLY_JCB_NUMBER - Reputation.monthly_limitation(current_user).length
  end
end
