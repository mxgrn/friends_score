class Notifications < ActionMailer::Base
  default from: "no-reply@friends-score.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_record.subject
  #

  # Mail last record holder about record been beaten
  def new_record(score)
    @score = score

    last_best = @score.last_best
    @greeting = "Hey #{last_best.user.name}!"

    mail(to: last_best.user.email)
  end
end
