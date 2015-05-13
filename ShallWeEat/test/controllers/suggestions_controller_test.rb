require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  test "seaerch_food function" do
    sug_con = SuggestionsController.new()
		
		Food.create(id: 1, name: "chicken", spicy: 5, sour: 2, sweet: 3, salty: 5, bitter: 23, hot: 243, cold: 2424, calories: 11311, time: 23, price: 34)
		
		Food.create(id: 2, name: "ramen", spicy: 10000, sour: 2, sweet: 3, salty: 5, bitter: 23, hot: 233, cold: 224, calories: 111, time: 23333, price: 34)

		Food.create(id:3, name: "steak", spicy: 000, sour: 2, sweet: 33333, salty: 5, bitter: 23, hot: 243, cold: 244, calories: 111, time: 233, price: 34)
		answer_food_1 = sug_con.search_food([5,2,3,5,23,243,2424,11311,23,34],1)
		answer_food_2 = sug_con.search_food([10000,2,3,5,23,233,224,111,23333,34],1)
		answer_food_3 = sug_con.search_food([0,0,33333,0,0,0,0,0,0,0],1)
		
		if(answer_food_1[0] == "chicken" && 
				answer_food_2[0] == "ramen" &&
					answer_food_3[0] == "steak")
			assert true
		else
			assert false
		end
			
   end
end
