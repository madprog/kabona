Given /^I have an account "([^"]+)" with (-?)\$(\d+)$/ do |name, minus, amount|
  @account = Account.new :name => name
  @account.save!

  @account.new_transaction('initialization') { |ta| ta.new_part :initial, minus + amount } if amount
end

When /^I buy (.*)$/ do |description, details|
  @account.new_transaction description do |ta|
    details.hashes.each do |attributes|
      raise "invalid amount: #{attributes[:amount]}" unless attributes[:amount] =~ /^\$(-?\d+(?:\.\d\d)?)$/
      ta.new_part attributes[:category], "-#$1"
    end
  end

  @account = Account.find_by_id @account.id
end

Then /^account balance should be \$(\d+)$/ do |amount|
  assert_equal Float(amount), @account.balance
end
