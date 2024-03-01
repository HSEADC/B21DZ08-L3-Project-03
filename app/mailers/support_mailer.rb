class SupportMailer < ApplicationMailer
    def user_support_request_email
        @email = params[:support][:email]
        attachments.inline['email_sender.png'] = File.read('app/assets/images/email_sender.png')
        mail(to: @email, subject: "Ваше обращение в поддержку принято")
    end
    def admin_support_request_email
        @email = params[:support][:email]
        @comment = params[:support][:comment]
        mail(to: "admin@test.com", subject: "Новое обращение в поддержку")
    end
end
