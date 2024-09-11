module Find_account
  def find_account(name)
  	@account.find { |acc| acc[:name] == name }  	
  end
end