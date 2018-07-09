users = User.transaction do
  (1..100).map do |x|
    User.create(name: "user#{x}")
  end
end

User.transaction do
  2000.times do
    followee_id = rand(users.last.id) + 1
    follower_id = rand(users.last.id) + 1
    if followee_id != follower_id
      Follow.create(followee_id: followee_id,
                    follower_id: follower_id)
      puts "followee_id=#{followee_id}, follower_id=#{follower_id}"
    end
  rescue
  end
end

User.transaction do
  users.each do |user|
    num = rand(100)
    puts "#{user.id} - #{num}"
    num.times do |x|
      recipe = Recipe.new(user: user, title: "recipe #{x} of #{user.name}")
      RecipeService.run(user: user, recipe: recipe)
    end
  end
end

last_id = Recipe.last.id
User.transaction do
  users.each do |user|
    rand(50).times do
      recipe = Recipe.find(rand(last_id) + 1)
      BookmarkService.run(user: user, recipe: recipe)
    end
    puts "bookmarked: #{user.id}"
  end
end
