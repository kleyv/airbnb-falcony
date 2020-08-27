class FundingsController < ApplicationController
  def create
    @funding = Funding.new(funding_params)
    @funding.investor = current_user
    @funding.project_id = params[:project_id]
    @funding.funding_shares = @funding.project.total_funding/@funding.funding_amount
    if @funding.save
      redirect_to project_fundings_path(params[:project_id]), :notice => 'Offer sent!'
    else
      render "projects/show"
    end
  end

  def index
    @fundings = Funding.all.where(investor_id: current_user.id)
  end

  private

  def funding_params
    params.require(:funding).permit(:funding_amount)
  end
end
