class ReputationsController < ApplicationController
  before_filter :monthly_reputation_limitation, only: [:create]
  before_filter :authenticate_user

  MONTHLY_JCB_NUMBER = 10

  def new
    @reputation = Reputation.new
  end

  def create
    @reputation = Reputation.new(reputation_params)
    @reputation.sender = current_user
    if @reputation.save
      flash[:success] = "Thank you!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, please check your input."
      render :new
    end
  end

  private
  def reputation_params
    params.require(:reputation).permit(:receiver_id, :sender_id, :reason)
  end

  def monthly_reputation_limitation
    if Reputation.monthly_limitation(current_user).length >= MONTHLY_JCB_NUMBER
      flash[:error] = "You have used all your JCB in this month."
      redirect_to root_path
    end
  end
end
