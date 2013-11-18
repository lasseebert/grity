class DomainsController < ApplicationController

  def show
    @domain = Domain.get params[:host]
    raise Mongoid::Errors::DocumentNotFound, "No domain with host '#{params[:host]}'" unless @domain
  end

  def stats
    domain = Domain.find params[:id]
    render json: {
      by_date: DomainStats.by_date(domain),
      by_url: DomainStats.by_url(domain)
    }
  end

end
