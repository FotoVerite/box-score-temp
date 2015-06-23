class EmailGateway
  attr_reader :mailer
  attr_accessor :errors

  def initialize
    @mailer = Mailchimp::API.new(ENV["MAILCHIMP_API_KEY"])
    @errors = []
  end

  def subscribe(email, list_id: newsletter_list_id)
    mailer.lists.subscribe(
      list_id,
      email: email,
    )
  rescue => e
    errors << e.message
  end

  def success?
    !errors.any?
  end

  private

  def newsletter_list_id
    @_newsletter_list_id = newsletter_list['id']
  end

  def newsletter_list
    @_newsletter_list ||= mailer.lists.list['data'].find do |list|
      list['name'] = "Newsletter"
    end
  end
end
