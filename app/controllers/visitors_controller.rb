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

  def signup_analysis
    @total_sign_up = Visitor.where(signup_flag: true).count
    @total_visit_count = Visitor.where(page_visited_flag: true).count
    @total_users = Visitor.count
    @percentage_of_sign_ups = (@total_sign_up.to_f / @total_users) * 100
    @percentage_of_visitors = (@total_visit_count.to_f / @total_users) * 100
  end

  def multiple

  end

  def multiple_post
    emails = params[:visitors].split(",")
    emails.each do |email|
      Visitor.create(email_id: email, email_date: params[:date])
    end
    render json: {visitors: Visitor.all}
  end

  def clear_db
    Visitor.all.each do |v|
      v.destroy
    end
    render json: {visitors: Visitor.all}
  end
end
