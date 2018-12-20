require 'rails_helper'

describe PlaysController do
  it 'should create a play' do
    expect(Play.count).to be(0)
    image = Image.create(file: Rack::Test::UploadedFile.new("#{Rails.root}/spec/data/avatar.jpg", "mime/type"))
    post :create, params: { play: {
        counter: 1,
        img_url: Rails.application.routes.url_helpers.url_for(image.file)
      }, format: :js
    }
    expect(Play.count).to be(1)
  end

  it 'should not create a play if counter is lessthan 1' do
    expect(Play.count).to be(0)
    image = Image.create(file: Rack::Test::UploadedFile.new("#{Rails.root}/spec/data/avatar.jpg", "mime/type"))
    post :create, params: { play: {
        counter: 0,
        img_url: Rails.application.routes.url_helpers.url_for(image.file)
      }, format: :js
    }
    expect(Play.count).to be(0)
  end
end
