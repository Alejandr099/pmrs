class ContactMailer < ApplicationMailer

  def email_user user_id, first_name, last_name, email, message
    @user = Account.find(user_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @message = message

    if @user.present?
      mail to: @user.email, message: "You have a new contact from PMS by A.W."
    end
  end
end