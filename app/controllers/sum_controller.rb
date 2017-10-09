class SumController < ApplicationController
  def index
	CSV.for_each do (row)
		sum += row[0]
   	end
	render text: sum
  end
end
