# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@brownfield_of_dreams.io'
  layout 'mailer'
end
