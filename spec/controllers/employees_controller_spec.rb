require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  let(:valid_attributes) {
    # skip("Add a hash of attributes valid for your model")
    {
      "name" => "Ram",
      "phone" => "1234567890",
      "email" => "rpatil1390@gmail.com"
    }  
  }

  let(:invalid_attributes) {
    # skip("Add a hash of attributes invalid for your model")
    {
      "name" => "",
      "phone" => "123",
      "email" => ""
    }  
  }

  let(:valid_session) { {} }

  
  describe "GET #index" do
    it "assigns all employees as @employees" do
      employee = Employee.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:employees)).to eq([employee])
    end
  end

  describe "GET #show" do
    it "assigns the requested employee as @employee" do
      employee = Employee.create! valid_attributes
      get :show, {:id => employee.to_param}, valid_session
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "GET #new" do
    it "assigns a new employee as @employee" do
      get :new, {}, valid_session
      expect(assigns(:employee)).to be_a_new(Employee)
    end
  end

  describe "GET #edit" do
    it "assigns the requested employee as @employee" do
      employee = Employee.create! valid_attributes
      get :edit, {:id => employee.to_param}, valid_session
      expect(assigns(:employee)).to eq(employee)
    end
  end

end
