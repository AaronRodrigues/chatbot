require 'bot'

describe Twitch do
	let(:bot) {described_class.new(logger = nil)}
  
  describe 'initializes a bot' do
  	it 'exists' do
  		expect(bot).to be_truthy
  	end
  	it ' with a new logger' do
  		expect(bot.logger).to be_kind_of(Logger)
  	end	
  	it ' and checks running status' do
  		expect(bot.running).to eq false
  	end
  	it ' and checks socket' do
  		expect(bot.socket).to eq nil
  	end  	
  end
  
  context 'Running behaviour of the bot' do
  	xit 'can reply to a message' do
  		bot.send('!hello')
  		expect(bot.send('hello')).to eq 'hello'
  	end
  context 'Stopping the bot' do
  	it ' can change running status when stopped' do
  		bot.stop
  		expect(bot.running).to eq false
  	end
  end
 end
end