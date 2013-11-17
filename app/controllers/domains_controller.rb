class DomainsController < ApplicationController

  def show
    @domain = Domain.get params[:host]
    raise Mongoid::Errors::DocumentNotFound, "No domain with host '#{params[:host]}'" unless @domain
  end

  def stats
    domain = Domain.find params[:id]
    render json: DomainStats.get(domain)
  end

end
