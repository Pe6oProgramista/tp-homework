require "csv"

class SumController < ApplicationController  
def index
	#@csv_response = `curl -F "file=@/home/elsyser/file.csv" https://row-sum.herokuapp.com/`
	arr = CSV.parse(params["file"].read)
	CSV.each do |row|
		sum += row[0]
   	end
	render text: "zdr"
  end
end
