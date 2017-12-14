class AdminsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@defaultitems = Defaultitem.all.order('created_at desc')
  	@date_range   = %w(mon tue wed thu fri sat sun)
  end
end
