# User.create!(
# 	email: "test@test.com",
# 	password: "tester",
# 	password_confirmation: "tester",
# 	name: "Admin User",
# 	roles: "site_admin"
# )
puts "Admin user created"

3.times do |topic|
	Topic.create!(
		title: "Topic #{topic}"
	)
end

puts "3 Topics created"

10.times do |blog|
	Blog.create!(
		title: "Blog Post number #{blog}",
		body: "This is a long description of a something that happened. We are going to explain all of the details and have a lot of colorful words that will allow you to see the whole experience as a unit. The verbose explanation may seem unnecessary but it will allow us to seee how a long text looks inside our program and thus it is quite useful. We can make the text even longer by writing another sentence that will talk about our perceptions, feelings and experiences. Let us conclude this text by saying how important it was to write.",
		topic_id: Topic.last.id
	)
end

puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
		title: "Skill number #{skill}",
		percent_time: 15
	)
end

puts "5 skills created"

8.times do |portfolio|
	Portfolio.create!(
		title: "Porfolio number #{portfolio}",
		subtitle: "Ruby on rails",
		body: "This is a long description of a something that happened. We are going to explain all of the details and have a lot of colorful words that will allow you to see the whole experience as a unit. The verbose explanation may seem unnecessary but it will allow us to seee how a long text looks inside our program and thus it is quite useful. We can make the text even longer by writing another sentence that will talk about our perceptions, feelings and experiences. Let us conclude this text by saying how important it was to write.",
		main_image: "https://via.placeholder.com/600x400.png",
		thumb_image: "https://via.placeholder.com/350x200.png",
		position: portfolio
	)
end

1.times do |portfolio|
	Portfolio.create!(
		title: "Porfolio number #{portfolio}",
		subtitle: "Angular",
		body: "This is a long description of a something that happened. We are going to explain all of the details and have a lot of colorful words that will allow you to see the whole experience as a unit. The verbose explanation may seem unnecessary but it will allow us to seee how a long text looks inside our program and thus it is quite useful. We can make the text even longer by writing another sentence that will talk about our perceptions, feelings and experiences. Let us conclude this text by saying how important it was to write.",
		main_image: "https://via.placeholder.com/600x400.png",
		thumb_image: "https://via.placeholder.com/350x200.png"
	)
end

puts "9 portfolios created"

3.times do |technology|
	# Portfolio.last.technolgies.create!(name: "asd") # can be used to create technology from existing portfolio
	Technology.create!(
		name: "Technology number #{technology}",
		portfolio_id: Portfolio.last.id
	)
end

puts "3 technologies created"
