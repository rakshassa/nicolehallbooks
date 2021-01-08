class HomesController < ApplicationController
  def show
    @subscription = Subscription.new
    @posts = NewsItem.news.order("posted_date DESC").paginate(page: params[:page], per_page: APP_CONFIG['posts_per_page'])
  end

  def privacy

  end

  def books
    @subscription = Subscription.new
    @posts = NewsItem.books.order("posted_date DESC")
    # 10/14/2020 - Nicole no longer wants pagination on the books page.
    # @posts = NewsItem.books.order("posted_date DESC").paginate(page: params[:page], per_page: APP_CONFIG['posts_per_page'])
  end

  def contact
    @subscription = Subscription.new
  end

  def about
    @subscription = Subscription.new
  end

  def backdoor
  end

  def whitelist
  end

  def signup
    @subscription = Subscription.new
  end

  def subscribed
  end

  def email
    if verify_recaptcha
      data = params[:body]
      subject = params[:subject]
      @from_email = params[:email]
      ApplicationMailer.send_nicole_email(data, @from_email, subject).deliver

      redirect_to root_path, notice: 'We sent your email to Nicole.'
    else
      redirect_to root_path, notice: 'Please complete the captcha to subscribe.'
    end
  end
end
