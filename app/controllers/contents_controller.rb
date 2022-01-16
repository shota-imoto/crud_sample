class ContentsController < ApplicationController
	def index
		@contents = Content.all
		logger.info(@contents.last.image)
		render json: @contents.map{ |c| {title: c.title, description: c.description, image: c.image.present? ? c.image.url : 'null'} }.to_json
	end

	def new
	end

	def create
		@content = Content.new(content_params)
		if @content.save
			render json: @content.to_json
		else
			render json: {error: "InvalidParamsError", message: "saving content is failed."}
		end
	end

	private

	def content_params
		params.permit(:image, :title, :description)
	end
end