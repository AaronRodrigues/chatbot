## Chatbot - A Tech Test for Stafford-Long

Simplified chat bot with pre-written messages and admin editor interface

Ruby 2.4.1
Rails 5.1.2
Test framework: RSpec
VCS: GIT

### Description
A user lands on the page and sends the first pre-written message to the bot (this is the root of the tree), they receive a response, for which they are then are presented with 2-3 optional possible pre-written messages to choose from to send back, each of which lead to a new ‘response’ from from the bot, and so on.
At particular points the response they choose may also lead to the end of the game (end is simply pass / fail).
All routes down the message tree should ultimately end in a pass/fail.

### Admin / backend:
Authorisation system
Ability to view / edit the current game chat ‘flow’ and add to it
Ability to mark a message the user receives as triggering the end of the game (with success or failure), otherwise the message received should give 2-3 possible responses the user will be able to choose

### User / Front end:
First message from bot shown to user after short delay
Available choices of response can be cycled through, allows user to pick one and ‘send'
Corresponding response message comes back from bot after short delay
Repeat above steps until game end is triggered by one of the responses
Present game end screen (pass / fail) and option to replay

### Bonus points
Add some feature specs
Make it feel ‘chatty’ by implying the bot is typing during the delay periods
Stats dashboard showing # of times game played, # times completed, # of wins, # of losses, # of replays and anything else you feel is appropriate


### Approach

1. I chose to write a script for a bot which could be integrated with any website with a chat api. For my solution I have used www.twitch.com as an example. 
2. Twitch is a live streaming video platform owned by Twitch Interactive, a subsidiary of Amazon.com. 
3. The bot can join a channel and interact with user.
4. The bot will follow a Victorian etiquette :
“Do not speak unless spoken to”
5. For a number of predetermined inputs the bot will reply back to the user.

### Installation

1. Clone this repository by typing the following in the command line.
   ```
   git clone git@github.com:AaronRodrigues/chatbot.git
   ```
2. To install dependencies, type:
   ```
   bundle install
   ```
3. A twitch account is needed to check if the bot works. Create an account on twitch.
4. Register the bot or application here : https://www.twitch.tv/settings/connections
5. Fill in the Application Name
6. Redirect URI is http://localhost for local use
7. Select ChatBot for Application Category
8. Generate an oAuth token
9. Create a .env file in the root directory
10.Fill it with 
   ```
   TWITCH_CHAT_TOKEN = 'oauth:your_oauth_token'
   TWITCH_USER       = 'your_user_name'
   ```
11.To run the program, in the command line type
   ```
   ruby ./lib/bot.rb
   ```
12. If connected successfully, the bot can now join your channel
13. In the command line, type the following to enable the bot to join your channel
```
JOIN #channelname
```
14. The bot currently responds to a set of predetermined words - !hello, !sup, !hows it going? and  !home

### Thought Process

1. The first step was to connect to Twitch's server to make sure, we have some acknowledgement that we have established a connection.
2.  We need the ruby socket library to listen to connections
3. Connect to the twitch server irc.chat.twitch.tv
4. As long as the socket is running, we want to print whats on the socket to the screen
5. In the IO class which is the parent class of socket we return an array, which gets the socket, the next line and prints it to the screen
6. We use a logger library to print out messages to the screen
7. After connecting to the server, we want to send our authentication details. The bot can then join a channel and interact with users.

### Further Implementation

1. Next I would implement a state machine which would take in a series of nested sentences that would simulate a more natural conversation.
2. For a Rails implementation, I would implement the user authentication using something similar to passport which is middleware for node.js, or build it from scratch as it is a standard boilerplate code that we have worked with on projects. 
3. For the front end, I would use bootstrap with some HTML and CSS to make it look pretty.