class VisitorsController < ApplicationController
  def signup
    visitor = Visitor.find_by_identifier(params[:identifier])
    visitor.email_id = params[:email]
    visitor.signup_flag_time = Time.now
    visitor.signup_flag += 1
    visitor.save
    redirect_url = "http://inderps.github.io/quotation-maker/thankyou.html"
    redirect_url = "http://localhost:8000/thankyou.html" if Rails.env == "development"
    redirect_to redirect_url
  end
end
