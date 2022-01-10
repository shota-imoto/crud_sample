require "rails_helper"

RSpec.describe ApplicationController, :type => :request do
	describe 'Rack::Cors' do
		let(:params) { { test: { x_params: "x", y_params: "y"} } }
		before do
			Rails.application.routes.draw do
				resources :rack_tests, only: %i(index create)
			end


			class RackTestsController < ApplicationController
				def create
					pp request.headers["Content-Type"]
					pp request.headers["Access-Control-Request-Headers"]
					pp request.headers["Origin"]
					pp "--------------------------"
					pp request.body.to_json
					render json: params[:test], status: :ok
				end
			end

			subject
		end

		subject { post rack_tests_path, headers: {"Origin": 'http://example.work', "Access-Control-Request-Headers": "content-type", "Access-Control-Request-Method"=>"POST", "Content-Type": "application/json"}, params: params.to_json }

		it do
			expect(response.status).to eq 200
		end

		it do
			expect(response.headers).to eq({}.to_json)
		end

		it do
			expect(response.body).to eq(params[:test].to_json)

		end
	end
end