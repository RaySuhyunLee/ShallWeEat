# ShallWeEat

## Iteration 4

the source code is inside ShallWeEat/ShallWeEat/ directory.

You can run the server by using commands below
```
bundle install
bin/rake db:migrate
bin/rails s
```

You need to put food data to db. To do this you can start rails console
```
bin/rails c
```
and type commands below
```
Food.create(name: "후라이드 치킨", tag: "치킨", spicy: 20, sour: 5, sweet: 50, salty: 50, bitter: 5, hot: 70, cold: 30, calories: 247, time: 50, price: 50, image: "/assets/original_chicken.jpg") #middle size one piece
Food.create(name: "라면", tag: "라면" spicy:70, sour:0, sweet:20, salty:30, bitter:0, hot:80, cold:20, calories:385, time:5, price:5, image: "/assets/ramen.jpg") 
Food.create(name: "짜장면" tag: "짜장면", spicy: 20, sour: 5, sweet:40, salty:30, bitter:5, hot:50, cold:50, calories: 785, time:15, price:18, image: "/assets/black_bean_sauce_noodles.jpg")
Food.create(name: "스테이크", tag: "스테이크", spicy:10, sour:5, sweet:60, salty:40, bitter:0, hot:40, cold:60, calories:252, time:80, price:85, image: "/assets/steak.jpg")
Food.create(name: "토마토 스파게티", tag: "스파게티", spicy:35, sour:0, sweet:45, salty:20, bitter:2, hot:40, cold:60, calories:220, time:70, price:67, image: "/assets/tomatto_spaghetti.jpg")
Food.create(name: "브리또", tag: "브리또", spicy:30, sour:10, sweet:38, salty:45, bitter:5, hot:37, cold:63, calories:282, time:30, price:20, image: "/assets/burrito.jpg")
Food.create(name: "피자", tag: "피자", spicy: 34, sour:0, sweet:44, salty:50, bitter:2, hot:43, cold:57, calories:208, time:50, price:53, image: "/assets/pizza.jpg") #one piece
Food.create(name: "햄버거", tag: "햄버거", spicy:10, sour:3, sweet:33, salty:48, bitter:1, hot:27, cold:73, calories:270, time:20, price:28, image: "/assets/hamburger.jpg")
Food.create(name: "피쉬 앤 칩스", tag: "피쉬 앤 칩스", spicy:10, sour:30, sweet:65, salty:40, bitter:0, hot:40, cold:0, calories:838, time:25, price:30, image: "/assets/fish_chips.jpg")
Food.create(name: "떡볶이", tag: "떡볶이", spicy:70, sour:0, sweet:30, salty:40, bitter:3, hot:60, cold:40, calories:305, time:20, price:10, image: "/assets/stir_fried_rice_cake.jpg")
Food.create(name: "육회", tag: "육회", spicy:0, sour:4, sweet:70, salty:20, bitter:10, hot:10, cold:90, calories:408, time:50, price:50, image: "/assets/seasoned_raw_meat.jpg")
Food.create(name: "사시미", tag: "사시미", spicy:0, sour:20, sweet:30, salty:0, bitter:30, hot:15, cold:85, calories:289, time:70, price:100, image: "/assets/sashimi.jpg")
Food.create(name: "비빔밥", tag: "비빔밥", spicy:40, sour:5, sweet:20, salty:20, bitter:20, hot:60, cold:40, calories:385, time:35, price:25, image: "/assets/bibmbap.jpg")
Food.create(name: "냉면", tag: "냉면", spicy:10, sour:40, sweet:30, salty:10, bitter:20, hot:0, cold:100, calories:267, time:25, price:25, image: "/assets/cold_noodles.jpg")
Food.create(name: "수육", tag: "수육", spicy:5, sour:3, sweet:50, salty:30, bitter:10, hot:55, cold:45, calories:403, time:45, price:60, image: "/assets/boiled_beef.jpg")
Food.create(name:  "탕수육", tag: "탕수육", spicy:0, sour:60, sweet:60, salty:20, bitter:0, hot:45, cold:55, calories:332, time:45, price:50, image: "/assets/sweet_and_sour_pork.jpg")
Food.create(name: "순대", tag: "순대", spicy:0, sour:0, sweet:15, salty:30, bitter:20, hot:40, cold:60, calories:133, time:20, price:10, image: "/assets/sundae.jpg")
Food.create(name: "간장게장", tag: "간장게장", spicy:0, sour:30, sweet:70, salty:50, bitter:0, hot:0, cold:100, calories:260, time:48, price:60, image: "/assets/soy_sauce_marinated_crab.jpg")
Food.create(name: "갈비탕", tag: "갈비탕", spicy:20, sour:2, sweet:6, salty:70, bitter:11, hot:95, cold:5, calories:466, time:80, price:43, image: "/assets/galbitang.jpg")
```


You can access in the web browser by connecting via http://localhost:3000/suggestions/questions

If you answers all the questions, the food information view will appear. When you press the good or bad button, it will send the feedback to the server and go back to the question view. We didn't add any food image yet, so you would not see the image.

###Some useful references
[ruby-fann](https://github.com/tangledpath/ruby-fann)  
[bootstrap](http://getbootstrap.com/)  
[rails guides](http://guides.rubyonrails.org/)  
