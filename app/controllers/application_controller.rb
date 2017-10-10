require 'csv'
require 'linear-regression'
#@csv_response = `curl -F "file=@/home/elsyser/file.csv" https://row-sum.herokuapp.com/`
class SumController < ApplicationController  
	protect_from_forgery with: :null_sessions
	#skip_before_action :verify_authenticity_token
	
	def sums_first_row
	
		arr = CSV.parse(params["test-file"].read, converters: :numeric)
		sum = 0
		arr.each do |row|
			sum += row[0]
	   	end
		render plain: "%.2f" % (sum).ceil	
	end
	
	def filter_sums
	
		arr = CSV.parse(params["test-file"].read, converters: :numeric)
		sum = 0
		arr.each do |row|
			if row[2] % 2 != 0
				sum += row[1]	
			end
		end
		render plain: "%.2f" % (sum).ceil
	end

	def great_sum
		arr = CSV.parse(params["test-file"].read, converters: :numeric)
		i = 0
		maxSum = 0
		while i <= len do
			j = 0
			sum = 0
			arr.each do |row|
				if j >= i
					sum += row[0]
				end
				j += 1
				if j == 30 + i
					break
				end
			end
			if maxSum <= sum
				maxSum = sum
			end
			i += 1
		end
		render plain: "%.2f" % (maxSum).ceil
	end
	
	def lin_regression
		arr = CSV.parse(params["test-file"].read, converters: :numeric)
		x = (1..arr.length).to_a
		y = arr.map {|row| row[0]}
		linear = Regression::Linear.new(x, y)
		a = linear.slope
		b = linear.intercept
		render plain: "%.6f" % a + "," + "%.6f" % b
	end
end


