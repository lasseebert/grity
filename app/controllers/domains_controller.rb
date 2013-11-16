class DomainsController < ApplicationController

  def show
    @domain = Domain.get params[:host]
    raise Mongoid::Errors::DocumentNotFound, "No domain with host '#{params[:host]}'" unless @domain
  end

  def stats
    domain = Domain.find params[:id]
    days = (params[:days] || 90).to_i
    render json: DomainStats.get(domain, days)
  end

end
