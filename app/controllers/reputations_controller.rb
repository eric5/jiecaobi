class ReputationsController < ApplicationController

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
end