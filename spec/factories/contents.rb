FactoryBot.define do
  factory :content do
    title 'Test Title'
    description 'Test Description'
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
  end
end
