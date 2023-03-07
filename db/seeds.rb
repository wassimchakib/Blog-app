## If you are using the app for the first time,
# you can use the commands below to setup test database to have the data below
# RAILS_ENV=test rails db:drop
# RAILS_ENV=test rails db:create
# RAILS_ENV=test rails db:schema:load
# RAILS_ENV=test rails db:seed

# Create 2 users : Wassim and Mert
wassim = User.create(name: 'Wassim Chakib', photo: 'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg', bio: "My name is Wassim, I'm a software developer with a passion in Java and React", postsCounter: 0)
mert = User.create(name: 'Mert Kaya', photo: 'https://cdn-icons-png.flaticon.com/512/5556/5556468.png', bio: 'My name is Mert, Cryptocurrency is my motivation. I dream to create my own coin in web3 market', postsCounter: 0)

# Create 3 posts for User: Wassim
wassimPost1 = Post.create(author: wassim, title: "How to succeed at software development", text: "Succeed at software development: set goals, practice regularly, collaborate, stay curious, learn from failures, prioritize testing, and keep up with industry trends.")
wassimPost2 = Post.create(author: wassim, title: "How to learn HTML and CSS", text: "Learn HTML/CSS: start with basics, use online resources, practice, code editors, join online communities, stay up-to-date. Create stunning web pages.")
wassimPost3 = Post.create(author: wassim, title: "How to learn ruby", text: "Start by learning the basics of Ruby's syntax. Practice writing code, use online resources, and participate in online communities. Consider building web applications with Ruby on Rails. Don't be afraid to ask for help. With persistence and dedication, you can become proficient in Ruby.")

# Create 1 post for User: Mert
mertPost1 = Post.create(author: mert, title: "How to learn solidity", text: "Learn Solidity: start with basics, read documentation, practice writing code, use online resources, join online communities, and participate in hackathons.")

# Generate 1 comment for User: Mert
mertcomment1 = Comment.create(author: mert, post: wassimPost1, text: "Thank you for publishing this informative blog post. It provided me with valuable insights and tips on how to succeed as a software developer. Keep up the good work!")
