class FundingsController < ApplicationController
  def create
    @funding = Funding.new(funding_params)
    @funding.investor = current_user
    @funding.project_id = params[:project_id]

    if @funding.save
      redirect_to project_fundings_path, :notice => 'Offer sent!'
    else
      render "projects/show"
    end
  end

  def index
    @fundings = Funding.all.where(investor_id: current_user)
  end

  private

  def funding_params
    params.require(:funding).permit(:funding_amount, :funding_shares)
  end
end
