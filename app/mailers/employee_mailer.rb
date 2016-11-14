class EmployeeMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def welcome_email(employee)
    @employee = employee
    @url  = 'http://example.com/login'
    mail(to: @employee.email, subject: 'Welcome to My Awesome Site')
  end
end
