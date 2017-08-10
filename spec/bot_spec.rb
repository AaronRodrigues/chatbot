require 'bot'

describe Twitch do
	let(:bot) {described_class.new(logger = nil)}
  
  describe 'initializes a bot' do
  	it 'exists' do
  		expect(bot).to be_truthy
  	end
  	it 'initializes with a new logger' do
  		expect(bot.logger).to be_kind_of(Logger)
  	end	
  end
end