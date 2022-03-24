require 'simplecov'
SimpleCov.root('../')
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 15
    after_accept = 515
    @register.accept_money(@transaction)
    assert_equal(after_accept, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 15
    assert_equal(5.00, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do 
      @register.give_receipt(@transaction)
    end
  end
    
end