module TweetsHelper
	def follow_link(user)
		return '-' if user.uid == current_user.uid
		case current_user.following?(user)
		when false
			link_to('Follow', follows_path(uid: user.uid), method: :post)
		when true
			link_to('Unfollow', follow_path(user.uid), method: :delete)
		end
	end
end
