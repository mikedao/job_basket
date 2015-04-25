class Api::V1::CompaniesController < ApplicationController
  def show
    company = Company.find(params[:id])

    render json: company, serializer: CompanySerializer
  end
end
