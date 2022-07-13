require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET to /' do
    it "returns 200 OK with the right content" do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to eq "Hello World"
    end
  end

  context 'GET to /hello' do
    it "should return 'Hello Ev'" do
      response = get('/hello?name=Ev')
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Hello Ev!</h1>")
    end

    it "should return 'Hello Steve'" do
      response = get('/hello?name=Steve')
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Hello Steve!</h1>")
    end
  end

  context 'POST to /submit' do
    it "returns message: Thanks Julia, you sent this message: 'Hello world'" do
      response = post('/submit?name=Julia')
      expect(response.status).to eq 200
      expect(response.body).to eq "Thanks Julia, you sent this message: 'Hello world'"
    end

    it 'returns message: Thanks Elena, you sent this message: "Hello world"' do
      response = post('/submit?name=Elena')
      expect(response.status).to eq 200
      expect(response.body).to eq "Thanks Elena, you sent this message: 'Hello world'"
    end
  end

  context 'GET to /names' do
    it 'returns "Julia, Mary, Karim"' do
      response = get('/names?names=Julia, Mary, Karim')
      expect(response.status).to eq 200
      expect(response.body).to eq "Julia, Mary, Karim"
    end

    it 'returns "Elena, Tom, Anna"' do
      response = get('/names?names=Elena, Tom, Anna')
      expect(response.status).to eq 200
      expect(response.body).to eq "Elena, Tom, Anna"
    end
  end

  context 'POST to /sort-names' do
    it 'returns "Alice,Joe,Julia,Kieran,Zoe"' do
      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')
      expect(response.status).to eq 200
      expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
    end

    it 'returns "Arabella,John,Joseph,Mary,Zoe"' do
      response = post('/sort-names?names=Joseph,Arabella,Mary,John,Zoe')
      expect(response.status).to eq 200
      expect(response.body).to eq "Arabella,John,Joseph,Mary,Zoe"
    end
  end
end