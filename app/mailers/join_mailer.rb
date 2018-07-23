class JoinMailer < ApplicationMailer
  def join_mail(group,manager_user,member_user)
    @group = group
    @manager_user = manager_user
    @member_user = member_user
    mail to:  @manager_user.email, subject: "#{group.name}に#{member_user.name}さんが参加しました。"
  end
end
