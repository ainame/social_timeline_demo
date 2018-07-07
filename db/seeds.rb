users = User.transaction do
  (1..1000).map do |x|
    User.create(name: "user#{x}")
  end
end

User.transaction do
  users.each do |user|
    num = rand(100)
    puts "#{user.id} - #{num}"
    num.times do |x|
      Recipe.create(user: user, title: "recipe #{x} of #{user.name}")
    end
  end
end

users = User.all
last_id = Recipe.last.id
User.transaction do
  users.each do |user|
    rand(30).times do
      recipe = Recipe.find(rand(last_id) + 1)
      BookmarkService.run(user: user, recipe: recipe)
    end
    puts "bookmarked: #{user.id}"
  end
end
