class VisitorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def signup
    visitor = Visitor.find_by_email_id(params[:email_id])
    if visitor.present?
      visitor.signup_flag += 1
      visitor.save
    else
      Visitor.create(email_id: params[:email_id], signup_flag_time: Time.now, signup_flag: 1)
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
      visitor.page_visited_flag = visitor.page_visited_flag + 1
      visitor.save
    else
      Visitor.create(email_id: params[:email_id], page_visited_flag: 1, page_visited_flag_time: Time.now)
    end
    render js: ''
  end
end
