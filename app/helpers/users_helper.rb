module UsersHelper
  def follow_link(user)
    return if user.uid == current_user.uid
    case current_user.following?(user)
    when false
      link_to('Follow', user_follows_path(user.uid), method: :post)
    when true
      link_to('Unfollow', user_follow_path(user.uid, user.uid), method: :delete)
    end
  end
end
