FactoryGirl.define do
  factory :employee do
  	name                  "Ram"
    email                 "rpatil1390@gmail.com"
    phone              	  "1234567890"
    # image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    image { File.new("#{Rails.root}/spec/fixtures/pepsi.png") } 
  end 
end

# FactoryGirl.create :employee do |employee|
#   employee.name                   "Ram"
#   employee.email                  "rpatil1390@gmail.com"
#   employee.phone                  "1234567890"
# end