require 'rails_helper'

RSpec.describe "landing_page/landing_page.html.erb", type: :view do
  it "shows a sign up button" do 
    render(template: "landing_page/landing_page")
    expect(rendered).to include "Sign up"
  end 
end
