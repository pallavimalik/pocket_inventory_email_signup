class VisitorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def signup
    visitor = Visitor.find_by_email_id(params[:email_id])
    if visitor.present?
      visitor.no_of_visits += 1
      visitor.save
    else
      Visitor.create(email_id: params[:email_id], signup_flag_time: Time.now, signup_flag: true, no_of_visits: 1)
    end
    redirect_url = 'http://localhost:8000/thankyou.html' if Rails.env == 'development'
    redirect_to redirect_url
  end

  def index
    visitors = Visitor.all
    render json: {visitors: visitors}
  end

  def create
    visitor = Visitor.find_by_email_id(params[:email_id])
    if visitor.present?
      visitor.no_of_visits += 1
      visitor.save
    else
      Visitor.create(email_id: params[:email_id], page_visited_flag: true, page_visited_flag_time: Time.now, no_of_visits: 1)
    end
    render js: ''
  end
end
