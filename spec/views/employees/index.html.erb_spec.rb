require 'rails_helper'

RSpec.describe "employees/index.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"

    before(:each) do
    @employee = assign(:employee, Employee.create!(
      :name => "Name", :email => "Email", :phone => "1234567890"
      # , :image => "Image"
    ))
    end
    
    it "displays all the employees" do
    render
    expect(rendered).to match /Name/
    expect(rendered).to match /Email/
    expect(rendered).to match /Phone/
    # expect(rendered).to match /Image/
  end

end


# stub_model = provides tools for testing ActiveModel classes