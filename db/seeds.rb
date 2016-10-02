# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Delete CreditPayments'
CreditPayment.delete_all

puts 'Delete Credits'
Credit.delete_all

puts 'Delete Clients'
Client.delete_all

puts 'Create Clients'
client1 = Client.create(name: 'Normal Pay Client')
client2 = Client.create(name: 'Early Pay Client')
client3 = Client.create(name: 'Late Pay Client')

puts 'Create Credits'
client1_credit = client1.credits.create(amount: 1_000_000, credit_period_months: 6, rate: 30, 
	period_months: 1, fine_rate: 50 )
client2_credit = client2.credits.create(amount: 1_000_000, credit_period_months: 6, rate: 30, 
	period_months: 1, fine_rate: 50 )
client3_credit = client3.credits.create(amount: 1_000_000, credit_period_months: 6, rate: 30, 
	period_months: 1, fine_rate: 50 )

puts 'Create CreditPayments'
client1_credit.credit_payments.create([
	{month: 1, amount: 191_666.67, is_fine: false},
	{month: 2, amount: 191_666.67, is_fine: false},
	{month: 3, amount: 191_666.67, is_fine: false},
	{month: 4, amount: 191_666.67, is_fine: false},
	{month: 5, amount: 191_666.67, is_fine: false},
	{month: 6, amount: 191_666.67, is_fine: false}
])

client2_credit.credit_payments.create([
	{month: 1, amount: 191_666.67, is_fine: false},
	{month: 2, amount: 191_666.67, is_fine: false},
	{month: 3, amount: 191_666.67, is_fine: false},
	{month: 4, amount: 525_000, is_fine: false},
	{month: 5, amount: 0, is_fine: false},
	{month: 6, amount: 0, is_fine: false}
])

client3_credit.credit_payments.create([
	{month: 1, amount: 191_666.67, is_fine: false},
	{month: 2, amount: 191_666.67, is_fine: false},
	{month: 3, amount: 208_333.33, is_fine: true, fine_months: 1},
	{month: 4, amount: 208_333.33, is_fine: true, fine_months: 1},
	{month: 5, amount: 208_333.33, is_fine: true, fine_months: 1},
	{month: 6, amount: 208_333.33, is_fine: true, fine_months: 1}
])

