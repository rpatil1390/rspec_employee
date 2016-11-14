require 'rails_helper'

RSpec.describe "employees/new.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'employees/new' do
    
	  before do
	    @employee = stub_model(Employee)
	    @employee.stub(:new_record?).and_return(true)
	    assigns[:employee] = @employee
	  end

	  it 'should render a form for the employee' do
	    # do_render
           

	     # response.should have_tag('form[method="post"][action=?]', employees_path) do
	    #   with_tag('input#employee_name[type="text"][name=?]', 'employee[name]')
	    #   with_tag('input#employee_email[type="text"][email=?]', 'employee[email]')
	    #   with_tag('input#employee_phone[type="text"][phone=?]', 'employee[phone]')

	    #   with_tag('input[type="submit"]')
	     # end
         expect(rendered).to have_tag('form', :with => { :action => '/new', :method => 'post' }) do
	     # response.should have_tag "form[action=new]" do
		   # with_tag "input[type=text][name=name]"
		   # with_tag "input[type=email][name=email]"

		 end
	   end

	  # it 'should render a link to employees_path' do
	  #   do_render
	  #   response.should have_tag('a[href=?]', employees_path)
	  # end

	  def do_render
	    render(:template => 'employees/new')
	  end
	end
end
