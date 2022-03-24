require 'simplecov'
SimpleCov.root('../')
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require '../transaction'

class TransactionTest < Minitest::Test

  def test_prompt_for_payment
    transaction = Transaction.new(20)

    good_transaction1 = StringIO.new('30')
    good_output1 = StringIO.new('')
    transaction.prompt_for_payment(input: good_transaction1, output: good_output1)
    assert_equal(30, transaction.amount_paid)

    good_transaction2 = StringIO.new('22.00')
    good_output2 = StringIO.new('')
    transaction.prompt_for_payment(input: good_transaction2, output: good_output2)
    assert_equal(22.0, transaction.amount_paid )


    # invalid_input1 = StringIO.new('-20')
    # transaction.prompt_for_payment(input: invalid_input1)
    # assert_output('That is not the correct amount. ' \
    #   'Please make sure to pay the full cost.') do 
    #     transaction.prompt_for_payment(input: invalid_input1)
    #   end
    # assert_equal(22.0, transaction.amount_paid )

    # invalid_input2 = StringIO.new('15')
    # assert_output('That is not the correct amount. ' \
    #   'Please make sure to pay the full cost.') do
    #     transaction.prompt_for_payment(input: invalid_input2)
    #   end
    #   assert_equal(22.0, transaction.amount_paid )
  end
end



