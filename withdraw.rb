module Withdraw
	def withdraw(name,amount,pin)  
  	account = find_account(name)
    if account[:pin] == pin
    	if account[:amount] >= amount
		   account[:amount] -= amount
		   puts "withdraw succeseful"
		   puts " Amount left is #{account[:amount]}"
		 else
		 	puts "insufficient funds,your balance is only #{account[:amount]}"
		 end
	 else
	 	puts "You enterd the wrong pin"
	 end
 end
end