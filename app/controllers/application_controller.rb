class ApplicationController < ActionController::API
	CLIENT_HOST = "http://localhost:3000"

	before_action :set_cors

	def set_cors
		response.headers["Access-Control-Allow-Origin"] = CLIENT_HOST
		response.headers["Access-Control-Request-Method"] = '*'
	end
end
