require 'rails_helper'

RSpec.describe "employees/show.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @employee = assign(:employee, Employee.create!(
      :name => "Name", :email => "Email", :phone => "1234567890"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
  end
end
