class RecipeService

  def self.run(user:, recipe:)
    new(user).run(recipe)
  end

  def initialize(user)
    @user = user
  end

  def run(recipe)
    Recipe.transaction do
      recipe.save!
      feed_items = @user.followers.map do |follower|
        FeedItem.new(user_id: follower.id,
                     actor_id: recipe.user_id,
                     resource_type: Recipe.base_class.name,
                     resource_id: recipe.id)
      end
      FeedItem.import!(feed_items)
    end
  end
end
