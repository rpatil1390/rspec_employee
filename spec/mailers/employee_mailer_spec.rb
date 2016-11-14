require "rails_helper"

RSpec.describe EmployeeMailer, type: :mailer do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'should have access to URL helpers' do
    expect { employees_url :host => 'localhost' }.not_to raise_error
    expect { raise "oops" }.to raise_error(RuntimeError)
  end
end
