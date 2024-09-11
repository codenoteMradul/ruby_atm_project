module Details
	def details(name,pin)  
  	account = find_account(name)
    if account[:pin] == pin
  	  puts "Name = #{account[:name]}"
  	  puts "Bank Balance = #{account[:amount]}"
  	else
	    puts "You enterd the wrong pin"
	  end
  end
end