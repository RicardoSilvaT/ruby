
class CompaniesController < ApplicationController
	#controler index
  def index
		@companies = Company.all
	end
  #controlee new
	def new
    @company = Company.new
  end

  #controler create
  def create
    #se crean las compañias con el metodo parametros(company_params)
  @company = Company.new(company_params)
    #condicional "si guardo la compañia, redireccione al index";
    if @company.save
      redirect_to companies_path
    #si no lo guardo vuelva y ponga el formulario
    else
      render :new
    end
  end

  #controller edit: crea una vista
  def edit
    @company = Company.find(params[:id])
  end

  #controller update
  def update
    @company = Company.find(params[:id])
      if @company.update(company_params)
        redirect_to companies_path
      else
        render :edit
      end
  end

  #controller delete
  def delete
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private
  #metodo para pasar los parametros al create
    def company_params
      params.require(:company).permit(:Company_Name, :Company_Adrres_Code, :Company_Transport_Number,
         :Company_Mail, :Company_Web_Site, :Company_Registration_Status)
    end
end
