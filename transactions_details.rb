module Transactions_details
  	    # binding.pry
	  def transaction_details(name,pin)
  	acc1 = find_account(name)
    # acc2 = find_account(name2)
        
  	if acc1[:pin] == pin
  		puts "All transaction of account holder = #{acc1[:transaction]} "
  		puts "balance available of account holder is = #{acc1[:amount]}"

  	else
  		puts "You enter the wrong pin"
  	end
  end

end
