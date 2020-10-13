class User::DashboardController < User::BaseController
  def index
    @hosted_parties = current_user.hosted_parties
    @invited_parties = current_user.invited_parties
  end
end
