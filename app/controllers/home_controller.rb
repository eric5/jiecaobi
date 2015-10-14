class HomeController < ApplicationController

  def index
    @reputations = Reputation.order(created_at: :desc).page(params[:page])
  end
end
