module Deposit
	def deposit(name,amount,pin)
   account = find_account(name)
   if account[:pin] == pin
		account[:amount] += amount
		puts "deposit sucessfull"
		puts " new balance is #{account[:amount]}"
	 else
		puts "You enter the wrong pin"
	 end
 end
end