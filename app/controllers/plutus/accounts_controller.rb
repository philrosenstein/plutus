module Plutus
  # This controller provides restful route handling for Accounts.
  #
  # The controller supports ActiveResource, and provides for
  # HMTL, XML, and JSON presentation.
  #
  # == Security:
  # Only GET requests are supported. You should ensure that your application
  # controller enforces its own authentication and authorization, which this
  # controller will inherit.
  #
  # @author Michael Bulat
  class AccountsController < Plutus::ApplicationController
    unloadable

    # @example
    #   GET /accounts
    #   GET /accounts.xml
    #   GET /accounts.json
    def index
      @from_date = params[:from_date] ? Date.parse(params[:from_date]) : Date.today.at_beginning_of_month
      @to_date = params[:to_date] ? Date.parse(params[:to_date]) : Date.today
      @accounts = Account.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @accounts }
        format.json  { render :json => @accounts }
      end
    end
  end
end
