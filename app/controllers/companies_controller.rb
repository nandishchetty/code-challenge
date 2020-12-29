class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
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
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, flash: { notice: "Changes Saved" }}
        format.json { head :ok }
      else
        format.html { render :edit }
        format.json { head :bad_request }
      end
    end
  end  

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: 'Company was successfully deleted.'
    else
      render :edit, alert: "Failed to delete company"
    end
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
      :brand_color,
      services: []
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
  
end
