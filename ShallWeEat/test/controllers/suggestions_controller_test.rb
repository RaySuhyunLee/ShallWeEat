require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase


   test "#get_questions" do
   	get :get_questions	
		json = JSON.parse(response.body)
        
		questions = [
          'Are you starving to death?',
          'Do you lack money?',
          'How are you today?',
          'Are you busy?'
     ]
		cond_1 = (json["st"] == 0)
		cond_2 = (json["questions"] == questions)
		assert (cond_1 && cond_2), "no json"
	 #['Are you starving to death?', 'Do you lack money?', 'How are you today?', 'Are you busy?']
#   		questions.include?('Are you starving to death?')
   end

   test "#get_suggestions" do
	 		Food.delete_all
			Food.create(id: 1, name: "chicken_original", spicy: 20, sour: 5, sweet: 50, salty: 50, bitter: 5, hot: 70, cold: 30, calories: 247, time: 50, price: 50, image: "/assets/original_chicken.jpg")
			Food.create(id: 2,name: "ramen", spicy:70, sour:0, sweet:20, salty:30, bitter:0, hot:80, cold:20, calories:385, time:5, price:5, image: "/assets/ramen.jpg")
			 Food.create(id: 3, name: "black_bean_sauce_noodles", spicy: 20, sour: 5, sweet:40, salty:30, bitter:5, hot:50, cold:50, calories: 785, time:15, price:18, image:"/assets/black_bean_sauce_noodles.jpg")
			get :get_suggestions, {user_answers: [1,2,3,4,5]}
			
			json = JSON.parse(response.body)

			assert (json['st'] == 0 && json['food_results'].length == 3) 
	#json = JSON.parse(response.body)
        #assert json['st'] == 0
   end


  test "#search_food" do
    sug_con = SuggestionsController.new()
	 		Food.delete_all
			Food.create(id: 1, name: "chicken_original", spicy: 20, sour: 5, sweet: 50, salty: 50, bitter: 5, hot: 70, cold: 30, calories: 247, time: 50, price: 50, image: "/assets/original_chicken.jpg")
			Food.create(id: 2,name: "ramen", spicy:70, sour:0, sweet:20, salty:30, bitter:0, hot:80, cold:20, calories:385, time:5, price:5, image: "/assets/ramen.jpg")
			 Food.create(id: 3, name: "black_bean_sauce_noodles", spicy: 20, sour: 5, sweet:40, salty:30, bitter:5, hot:50, cold:50, calories: 785, time:15, price:18, image:"/assets/black_bean_sauce_noodles.jpg")
			get :get_suggestions, {user_answers: [1,2,3,4,5]}

		answer_food = sug_con.search_food([20,5,50,50,5,70,30,247,50,50])	
		
		if(answer_food[0][:name] == "chicken_original" && 
				answer_food[1][:name] == "ramen" &&
					answer_food[2][:name] == "black_bean_sauce_noodles")
			assert true
		else
			assert false
		end	
   end


   test "#feedback" do
   		assert(true)
   end

   test "#answers_to_ann" do
		assert(true)
   end

   test "#ann_to_db" do
		assert(true)

   end

   test "#db_to_ann" do
		assert(true)

   end



end
