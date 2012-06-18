puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Admin', :email => 'admin@blackstarcorp.com', :password => 'adminadmin', :password_confirmation => 'adminadmin', :confirmed_at => DateTime.now
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Audreys Pearce', :email => 'audreyspearce@gmail.com', :password => 'audreysaudreys', :password_confirmation => 'audreysaudreys', :confirmed_at => DateTime.now
puts 'New user created: ' << user2.name
user.add_role :admin