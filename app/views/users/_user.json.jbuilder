json.user(user, :first_name, :last_name)
json.token user.generate_jwt
