class EmployeesController < ApplicationController
  def index
  	@employees = Employee.all
  	# abort @employees.inspect
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
     @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
         EmployeeMailer.welcome_email(@employee).deliver_later
        format.html { redirect_to @employee, notice: 'employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      @employee = Employee.find(params[:id])
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
   
    def employee_params
      params.require(:employee).permit(:name, :image, :phone, :email)
    end

end
