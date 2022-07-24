json.user do |user|
  json.partial! 'user/user', user: current_user
end
