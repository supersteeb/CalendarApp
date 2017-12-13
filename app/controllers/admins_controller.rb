class AdminsController < ApplicationController
	before_action :authenticate_user!
  def index
  	@defaultitems = Defaultitem.all.order('created_at desc')
  end
end
