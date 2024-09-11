require 'pry-byebug'
require_relative 'create'
require_relative 'find_account'
require_relative 'deposit'
require_relative 'withdraw'
require_relative 'details'
require_relative 'check_balance'
require_relative 'transfer'
require_relative 'transactions_details'

class Banking

	attr_accessor :name,:bank_bal,:pin,:amount
	def initialize
		@account = []
	end

	include Create
	include Find_account
  include Deposit
  include Withdraw
  include Details  
  include Check_balance
  include Transfer
  include Transactions_details


end

bank = Banking.new

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
		bank.transaction_details(name,pin)
	when 8
		break
	else
  puts "Please enter the number between 1 to 8"		
	end
end
