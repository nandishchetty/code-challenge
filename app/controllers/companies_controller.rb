class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
    flash[:notice] = 'Success'
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      render :edit
      flash[:alert] = @company.errors.messages
    end
  end  

  def destroy
    @company.destroy
    flash[:alert] = 'Successfully Deleted'
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id,
      :city,
      :state,
      :color,
      services: []
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
  
end
