require "rails_helper"

RSpec.describe ContentsController, :type => :request do
	describe '#index' do
		let(:content) { create(:content) }
		subject { get contents_path }

		it 'contentのリストが返る' do
			subject
			expect(response.body).to eq {}.to_json
		end

	end

end