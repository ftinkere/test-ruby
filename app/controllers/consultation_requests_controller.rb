class ConsultationRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @requests = ConsultationRequest.all
    render json: @requests
  end

  def show
    @request = ConsultationRequest.find(params[:id])
    render json: @request
  end

  def create
    p create_params

    @request = ConsultationRequest.create(create_params.merge(date: Date.today))
    render json: @request
  end

  private

  def create_params
    params.permit(:text, :patient_id)
  end
end
