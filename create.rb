module Create
	def create_account(name,pin)
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
end