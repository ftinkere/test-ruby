class RecommendationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    patient = Patient.find params[:patient_id]

    @recommendations = Recommendation.joins(:consultation_request, consultation_request: :patient)
                                   .where(consultation_request: { patient: })

    render json: @recommendations
  end

  def create
    consultation_request = ConsultationRequest.find params[:consultation_request_id]

    @recommendation = Recommendation.create create_params
    render json: @recommendation
  end

  private

  def create_params
    params.permit(:text)
  end
end
