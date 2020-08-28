class FundingsController < ApplicationController
  def create
    @funding = Funding.new(funding_params)
    @funding.investor = current_user

    @project = Project.find(params[:project_id])

    @funding.project_id = params[:project_id]
    @funding.funding_shares = @funding.funding_amount/@funding.project.total_funding.to_f * 100

    if @funding.save
      redirect_to project_fundings_path(params[:project_id]), :notice => 'Offer sent!'
    else
      render "projects/show"
    end
  end

  def index
    @fundings = Funding.all.where(investor_id: current_user.id).order(created_at: :desc)
  end

  private

  def funding_params
    params.require(:funding).permit(:funding_amount)
  end
end
