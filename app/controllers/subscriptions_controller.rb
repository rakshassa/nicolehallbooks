class SubscriptionsController < ApplicationController
  # before_action :set_news_item, only: [:update]

  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        @subscription.save
      end
      format.html { redirect_to root_path, notice: 'You are subscribed!' }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    # def set_subscription
    #   @subscription = Subscription.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:email)
    end
end
