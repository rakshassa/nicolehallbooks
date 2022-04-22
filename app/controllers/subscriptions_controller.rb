class SubscriptionsController < ApplicationController
  # before_action :set_news_item, only: [:update]

  def create
    @subscription = Subscription.new(subscription_params)

    # if verify_recaptcha && @subscription.save
    if @subscription.save
      tell_mailerlite(@subscription.email)
      redirect_to subscribed_homes_path
    else
      redirect_to signup_homes_path, notice: 'Captcha Failed'
    end    
  end

  private

  def tell_mailerlite(email)
    api_key = ENV['MAILERLITE_API_KEY']
    client = MailerLite::Client.new(api_key: api_key)

    response = client.create_subscriber(email: email)
    Rails.logger.info "Response from creating subscriber: " + response.to_s

    subscriber = { email: email }
    response = client.create_group_subscriber(92635902, subscriber)

    Rails.logger.info "Response from group subscription: " + response.to_s
  rescue MailerLite::Unauthorized, MailerLite::BadRequest
    Rails.logger.info "Failed to subscribe with mailerlite"
  end

  # def tell_mailchimp(email)
  #   Gibbon::Request.timeout = 15
  #   Gibbon::Request.open_timeout = 15
  #   Gibbon::Request.symbolize_keys = true
  #   Gibbon::Request.debug = true

  #   gibbon = Gibbon::Request.new

  #   # TODO: these are paged - so paginate iteration
  #   # lists = gibbon.lists.retrieve
  #   # Rails.logger.error "MailChimp Lists: " + lists.to_s

  #   list_id = 'e12c5fba2b'
  #   lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(email.downcase)
  #   gibbon.lists(list_id).members(lower_case_md5_hashed_email_address).upsert(
  #     body: {
  #       email_address: email.downcase,
  #       # merge_fields: {FNAME: "First Name", LNAME: "Last Name"},
  #       status: "subscribed"
  #     }
  #   )

  # rescue Gibbon::MailChimpError => e
  #   Rails.logger.error "Houston, we have a problem: #{e.message} - #{e.raw_body}"
  # end

  # Use callbacks to share common setup or constraints between actions.
  # def set_subscription
  #   @subscription = Subscription.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
