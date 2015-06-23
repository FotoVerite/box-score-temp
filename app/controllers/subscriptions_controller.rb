class SubscriptionsController < ApplicationController
  def create
    mailer = EmailGateway.new
    mailer.subscribe(params[:email])
    if mailer.success?
      flash[:notice] = "Subscription email has been sent to #{params[:email]}"
    else
      flash[:alert] = mailer.errors.join('\n')
    end

    redirect_to request.referer
  end
end
