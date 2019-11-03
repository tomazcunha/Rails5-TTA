class AdminStatistic < ApplicationRecord

  EVENTS = {
    total_users: "TOTAL_USERS",
    total_questions: "TOTAL_QUESTIONS"
  }

  # def self.set_total_users
  #   admin_statistic = AdminStatistic.find_or_create_by(event: EVENTS[:total_users])
  #   admin_statistic.value += 1
  #   admin_statistic.save
  # end

  # def self.set_total_questions
  #   admin_statistic = AdminStatistic.find_or_create_by(event: EVENTS[:total_questions])
  #   admin_statistic.value += 1
  #   admin_statistic.save
  # end

  def self.set_total_event(event)
    admin_statistic = AdminStatistic.find_or_create_by(event: event)
    admin_statistic.value += 1
    admin_statistic.save
  end

end
