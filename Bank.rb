require 'pry-byebug'
class Bank

	attr_accessor :name,:bank_bal,:pin,:amount
	def initialize
		@account = []
	end
 
	def create_account(name, pin)
    account = {
    	         name: name,
    	         pin: pin,
               amount: 1000,
               transaction: []
              }
    @account << account
    puts account
    puts "Account is created with balance 1000"
	end

	def deposit(name,amount,pin)
   account = find_account(name)
     binding.pry
   if account[:pin] == pin
		account[:amount] += amount
		puts "deposit sucessfull"
		puts " new balance is #{account[:amount]}"
	 else
		puts "You enter the wrong pin"
	 end
 end

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

  def check_balance(name,pin)
  	account = find_account(name)
   if account[:pin] == pin
  	  puts "Your current bank balance is #{account[:amount]}"
	 else
	  	puts "You entered the wrong pin"
	 end
  end

  def details(name,pin)  
  	account = find_account(name)
    if account[:pin] == pin
  	  puts "Name = #{account[:name]}"
  	  puts "Bank Balance = #{account[:amount]}"
  	else
	    puts "You enterd the wrong pin"
	  end
  end

  def transfer(name,name2,pin,amount)
    acc1 = find_account(name)
    acc2 = find_account(name2)
     
   if acc1[:pin] == pin	
   	  if acc1[:amount] >= amount
   	  	 acc1[:amount] -= amount
   	  	 acc2[:amount] += amount
   	  	 puts "transfer successfull"
   	  	 puts "amounted left in #{name} is #{acc1[:amount]}"
   	  	 puts "amount of #{name2} is #{acc2[:amount]}"
          binding.pry
   	  	 details = {amount: amount,name: name2}
   	  	 acc1[:transaction] << details

   	  else
   	  	puts "insufficient funds"
   	  end	 

   else
   	puts "you enter the wrong pin"
   end

  end

  def transaction_details(name,pin)
  	   # binding.pry
  	acc1 = find_account(name)
    # acc2 = find_account(name2)
        
  	if acc1[:pin] == pin
  		puts "All transaction of account holder = #{acc1[:transaction]} "
  		puts "balance available of account holder is = #{acc1[:amount]}"

  	else
  		puts "You enter the wrong pin"
  	end
  end

  def find_account(name)
  	@account.find { |acc| acc[:name] == name }  	
  end
end

bank = Bank.new

loop do
  puts "======================================="
	puts " 1. create \n 2. deposit \n 3. withdraw \n 4. deatils \n 5. check balance \n 6. transfer \n 7. transaction details \n 8. Exit"
	puts "Select an option"
	num = gets.to_i

	case num
	when 1
		puts "You press 1 which means you want to create account"
		puts "------------------------------------------------------"
		puts "Enter the name"
		name = gets.chomp.to_s
		puts "Enter the pin"
		pin = gets.to_i
		bank.create_account(name, pin)
	when 2
		puts "Enter the account holder's name"
		name = gets.chomp.to_s
    puts "Enter the amount you want to deposit"
		amount = gets.to_i
		puts "Enter the pin"
		pin = gets.to_i
		bank.deposit(name,amount,pin)
	when 3
		puts "You press 3 which means you want to withdraw money"
  	puts "------------------------------------------------------"
  	puts "name of account holder"
  	name = gets.chomp.to_s
  	puts "Enter the amount which you want to withdraw"
		amount = gets.to_i
		puts "Enter the pin"
		pin = gets.to_i
		bank.withdraw(name,amount,pin)
	when 4
    puts "you press 4 which means you want to see datails"
  	puts "------------------------------------------------------"
  	puts "Enter the account holder name"
		name = gets.chomp.to_s
		puts "Enter the pin"
		pin = gets.to_i
		bank.details(name,pin)
	when 5
		puts "You press 5 which means you want to check your balance"
  	puts "------------------------------------------------------"
  	puts "Enter the account holder name "
  	name = gets.chomp.to_s
  	puts "Please enter the pin"
		pin = gets.to_i
		bank.check_balance(name,pin)
	when 6 
		puts "you enter 6 which means you want to transfer money"
		puts "----------------------------------------------------"
		puts "your account name"
		name = gets.chomp.to_s
		puts "now enter the account holder name where you want to transfer the amonut"
		name2 =gets.chomp.to_s
		puts "Enter your pin code"
		pin = gets.to_i
		puts "Enter amount"
		amount = gets.to_i
		bank.transfer(name,name2,pin,amount)
	when 7
		puts "you enter 7 which means you want to see all transaction details"
		puts "-------------------------------------------------------------"
		puts "enter account holder name"
		name = gets.chomp.to_s
		puts "Enter the pin"
		pin = gets.chomp.to_i
		name2 = 
		bank.transaction_details(name,pin)
	when 8
		break
	else
  puts "Please enter the number between 1 to 8"		
	end
end
