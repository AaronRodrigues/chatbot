require 'bot'

describe Twitch do
	let(:bot) {described_class.new()}
  
  describe 'initializes a bot' do
  	it 'exists' do
  		expect(bot).to be_truthy
  	end  	
  end
end