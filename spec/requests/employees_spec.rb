require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /employees" do
    it "works! (now write some real specs)" do
      get employees_path
      expect(response).to have_http_status(200)
    end
  end

   describe "POST /employees" do
    it "works! (now write some real specs)" do
      post "/employees", :employee => {:name => "Ram"}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /employees/new" do
    it "works! (now write some real specs)" do
      get new_employee_path
      expect(response).to have_http_status(200)
    end
  end
  
end






