class AdminsBackoffice::WelcomeController < AdminsBackofficeController

  def index
    @total_users = AdminStatistic.find_by_event(AdminStatistic::EVENTS[:total_users])
    @total_questions = AdminStatistic.find_by_event(AdminStatistic::EVENTS[:total_questions])
  end
    # find_by_<nomeDoCampoTabela>
    # find_by pode ser usando para fuscar diretamente pelo campo
end
