class ATM
    attr_accessor :balance
  
    def initialize(balance)
      balance = balance
    end
  
    def dispense(amount)
      if amount <= balance
        balance -= amount
        return "Dispensing #{amount} KES. Remaining balance: #{balance} KES"
      else
        return "Insufficient funds"
      end
    end
  end
  
  def select_denomination_option
    puts "Select denomination option:"
    puts "a) 100, 200, 500 denominations"
    puts "b) 500, 1000 denominations"
    print "Enter your choice: "
    gets.chomp.downcase
  end
  
  atm = ATM.new(5000)
  
  puts "Current balance: #{atm.balance} KES"
  print "Enter amount to dispense: "
  amount = gets.chomp.to_i
  
  denomination_option = select_denomination_option
  
  case denomination_option
  when 'a'
    denominations = [500, 200, 100]
  when 'b'
    denominations = [1000, 500]
  else
    puts "Invalid option"
    exit
  end
  
  dispensed_notes = {}
  amount_remaining = amount
  
  denominations.each do |denomination|
    num_notes = amount_remaining / denomination
    if num_notes > 0 && num_notes <= (atm.balance / denomination)
      dispensed_notes[denomination] = num_notes
      amount_remaining -= num_notes * denomination
      atm.balance -= num_notes * denomination
    end
  end
  
  if amount_remaining == 0
    dispensed_notes.each do |denomination, num_notes|
      puts "Dispensing #{num_notes} notes of #{denomination} KES"
    end
    puts "Remaining balance: #{atm.balance} KES"
  else
    puts "Cannot dispense the requested amount"
  end
  