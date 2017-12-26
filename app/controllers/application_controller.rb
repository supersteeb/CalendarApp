class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :process_event

  def process_event(data)
  	json_data = []
  	data.each do |list|
      json_data << {
        name: list.id,
        start: list.created_at
      }
    end
    json_data
  rescue
  	return []
  end
end
