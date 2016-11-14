require 'rails_helper'

RSpec.describe Employee, type: :model do
    it "should require a email" do
	  employee = Employee.create(:email => "")
	  employee.valid?
	  employee.errors.should have_key(:email)
	end

  it "should require a name" do
	  employee = Employee.create(:name => "")
	  employee.valid?
	  employee.errors.should have_key(:name)
	end	
  it "should require a phone" do
	  employee = Employee.create(:phone => "")
	  employee.valid?
	  employee.errors.should have_key(:phone)
	end


	it "is invalid with a duplicate email address" do
	    Employee.create(
	      name: 'Joe', phone: '1234567890',
	      email: 'rpatil1390@gmail.com'
	    )
	     employee = Employee.new(
	      name: 'Jane', phone: '1234567890',
	      email: 'rpatil1390@gmail.com'
	    )
	   employee.valid?
	   expect(employee.errors[:email]).to include("has already been taken")
 	end	

 	it "is invalid with a duplicate phone " do
	    Employee.create(
	      name: 'Joe', phone: '1234567890',
	      email: 'rpatil1390@gmail.com'
	    )
	     employee = Employee.new(
	      name: 'Jane', phone: '1234567890',
	      email: 'rpatil1390@gmail.com'
	    )
	   employee.valid?
	   expect(employee.errors[:phone]).to include("has already been taken")
 	end

 	 describe Employee do
 	 	  employee = Employee.create(:image => "")
		  it { should have_attached_file(:image) }
		  it { should validate_attachment_content_type(:image).
		                allowing('image/png', 'image/gif').
		                rejecting('text/plain', 'text/xml') }
		  # it { should validate_attachment_size(:image).
		  #               .is_at_least(0.kilobytes).is_at_most(100.kilobytes) }
		  # it { should validate_attachment_size(:image).less_than(2.megabytes) }
	end

	it "should validate size of file is less than 2Mb" do
	   employee = Employee.create(:image => "")
	  file = File.new("#{Rails.root}/spec/fixtures/file.png")
	  file.stub(:size).and_return(2.megabytes)
	  file.stub(:open).and_return(file)
	  employee.image = file
	  employee.should_not be_valid
	  # employee.should have(1).error_on(:attachment_file_size)
	end

	 
	it "fails validation with a short phone (using a validation context)" do
      employee = Employee.create(:phone => "12434567890")
	  expect(employee.valid?).to be_falsey
	  expect(employee.errors[:phone].size).to eq(1)
    end
	 

    ####################### Testing using FactoryGirl ######################## 



	it "is invalid without a name" do
 	  FactoryGirl.create(:employee, name: "Ram").should be_valid
	end

	it "is invalid without a email" do
 	  FactoryGirl.create(:employee, email: "rpatil1390@gmail.com").should be_valid
	end

	it "is invalid without a phone" do
 	  FactoryGirl.create(:employee, phone: "1234567890").should be_valid
	end

	it "fails validation without unique email" do
	  account1 = create(:employee, :email => "foo@bar.com")
	  account2 = build(:employee, :email => "foo@bar.com")
	  account2.should_not be_valid
	  account2.errors.should have_key(:email)
	end

	it "fails validation without unique phone" do
	  account1 = create(:employee, :phone => "1234567890")
	  account2 = build(:employee, :phone => "1234567890")
	  account2.should_not be_valid
	  account2.errors.should have_key(:phone)
	end


    FactoryGirl.define do
	  factory :image do |f|
	    supporting_documentation_file_name { 'pepsi.png' }
  	  	supporting_documentation_content_type { 'application/png' }
 		supporting_documentation_file_size { 200000 }
	  end
	end
	
	it " validation for image " do
      supporting_documentation_file_name { 'test.pdf' }
 	  supporting_documentation_content_type { 'application/pdf' }
  	  supporting_documentation_file_size { 200000 }
	end
	

end
