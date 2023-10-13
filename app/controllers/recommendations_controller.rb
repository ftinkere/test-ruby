class RecommendationsController < ApplicationController
  require_dependency '../services/chatgpt_service.rb'
  skip_before_action :verify_authenticity_token

  def index
    patient = Patient.find params[:patient_id]

    @recommendations = Recommendation.joins(:consultation_request, consultation_request: :patient)
                                   .where(consultation_request: { patient: })

    render json: @recommendations
  end

  def create
    consultation_request = ConsultationRequest.find params[:consultation_request_id]

    @recommendation = Recommendation.create(create_params.merge(
                                              consultation_request:,
                                              text: ChatgptService.call("Представь, что ты врач. \n К тебе пришёл пациент и просит консультацию.\n Ты должен оказать её. Отвечай пациенту.\n Его слова:\n#{consultation_request.text}")))
    render json: @recommendation
  end

  private

  def create_params
    params.permit(:consultation_request_id)
  end
end
