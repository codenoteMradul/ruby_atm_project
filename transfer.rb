module Transfer
	 def transfer(name,name2,pin,amount)
     # binding.pry
    acc1 = find_account(name)
    acc2 = find_account(name2)
     
   if acc1[:pin] == pin	
   	  if acc1[:amount] >= amount
   	  	 acc1[:amount] -= amount
   	  	 acc2[:amount] += amount
   	  	 puts "transfer successfull"
   	  	 puts "amounted left in #{name} is #{acc1[:amount]}"
   	  	 puts "amount of #{name2} is #{acc2[:amount]}"
   	  	 details = {amount: amount,name: name2}
   	  	 acc1[:transaction] << details

   	  else
   	  	puts "insufficient funds"
   	  end	 

   else
   	puts "you enter the wrong pin"
   end

  end
end