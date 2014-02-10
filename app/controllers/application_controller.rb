class ApplicationController < ActionController::Base

  before_filter :handle_subdomain

  protect_from_forgery

  def handle_subdomain

    if @tenant = Tenant.find_by_subdomain(request.subdomain)
      PgTools.set_search_path(@tenant.id)
    else
      PgTools.restore_default_search_path
    end

  end

end
