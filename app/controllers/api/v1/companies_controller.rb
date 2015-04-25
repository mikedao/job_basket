class Api::V1::CompaniesController < ApplicationController
  def show
    company = Company.find(params[:id])

    render json: company, serializer: CompanySerializer
  end

  def index
    companies = Company.all

    render json: companies, each_serializer: CompanySerializer
  end
end
