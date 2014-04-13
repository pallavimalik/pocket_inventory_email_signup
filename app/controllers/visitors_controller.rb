class VisitorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def signup
    visitor = Visitor.find_by_email_id(params[:email_id])
    if visitor.present?
      visitor.signup_flag = true
      visitor.signup_flag_time= Time.now
      visitor.entered_email = params[:entered_email]
      visitor.save
    end
    redirect_url = 'http://pocket-inventory.com/thankyou.html'
    redirect_url = 'http://localhost:8000/thankyou.html' if Rails.env == 'development'
    redirect_to redirect_url
  end

  def index
    visitors = Visitor.all
    render json: {visitors: visitors}
  end

  def create
    unless params[:email_id].present? || !params[:email_id]=="undefined"
      require 'securerandom'
      params[:email_id] = SecureRandom.hex
    end

    visitor = Visitor.find_by_email_id(params[:email_id])
    unless visitor.present?
      visitor = Visitor.new(no_of_visits: 0, email_id: params[:email_id])
    end
    visitor.page_visited_flag = true
    visitor.page_visited_flag_time= Time.now
    unless(visitor.no_of_visits)
      visitor.no_of_visits = 0
    end
    visitor.no_of_visits += 1
    visitor.ip_address = request.remote_ip
    visitor.save
    render js: "setEmailID('#{params[:email_id]}');"
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
      Visitor.create(email_id: email, email_date: params[:date], no_of_visits: 0)
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
