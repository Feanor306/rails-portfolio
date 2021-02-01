10.times do |blog|
	Blog.create!(
		title: "Blog Post number #{blog}",
		body: "This is a long description of a something that happened. We are going to explain all of the details and have a lot of colorful words that will allow you to see the whole experience as a unit. The verbose explanation may seem unnecessary but it will allow us to seee how a long text looks inside our program and thus it is quite useful. We can make the text even longer by writing another sentence that will talk about our perceptions, feelings and experiences. Let us conclude this text by saying how important it was to write."
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

9.times do |portfolio|
	Portfolio.create!(
		title: "Porfolio number #{portfolio}",
		subtitle: "Awesome project",
		body: "This is a long description of a something that happened. We are going to explain all of the details and have a lot of colorful words that will allow you to see the whole experience as a unit. The verbose explanation may seem unnecessary but it will allow us to seee how a long text looks inside our program and thus it is quite useful. We can make the text even longer by writing another sentence that will talk about our perceptions, feelings and experiences. Let us conclude this text by saying how important it was to write.",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200"
	)
end

puts "9 portfolios created"