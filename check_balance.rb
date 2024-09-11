module Check_balance
	def check_balance(name,pin)
  	account = find_account(name)
   if account[:pin] == pin
  	  puts "Your current bank balance is #{account[:amount]}"
	 else
	  	puts "You enterd the wrong pin"
	 end
  end
end