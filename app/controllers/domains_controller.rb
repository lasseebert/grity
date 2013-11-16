class DomainsController < ApplicationController

  def show
    @domain = Domain.get params[:host]
    raise Mongoid::Errors::DocumentNotFound, "No domain with host '#{params[:host]}'" unless @domain
  end

end
