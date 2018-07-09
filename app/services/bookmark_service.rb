class BookmarkService
  def self.run(user:,recipe:)
    new(user).run(recipe)
  end

  def initialize(user)
    @user = user
  end

  def run(recipe)
    Recipe.transaction do
      bookmark = Bookmark.create!(user_id: @user.id, recipe_id: recipe.id)
      affinity = Affinity.find_or_create_by(from_user_id: @user.id,
                                            to_user_id: recipe.user_id)
      affinity.score += 1
      affinity.save!

      feed_items = @user.followers.map do |follower|
        FeedItem.new(user_id: follower.id,
                     actor_id: @user.id,
                     resource_type: Bookmark.base_class.name,
                     resource_id: bookmark.id)
      end
      FeedItem.import!(feed_items)
    end
  rescue ActiveRecord::RecordNotUnique
  end
end
