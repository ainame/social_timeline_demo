class BookmarkService
  def self.run(user:,recipe:)
    new(user).run(recipe)
  end

  def initialize(user)
    @user = user
  end

  def run(recipe)
    Recipe.transaction do
      Bookmark.create!(user_id: @user.id, recipe_id: recipe.id)
      affinity = Affinity.find_or_create(from_user_id: @user.id,
                                         to_user_id: recipe.user_id)
      affinity.score += 1
      affinity.save!
    end
  end
end
