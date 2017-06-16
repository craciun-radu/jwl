user = User.new(email: "admin@jwl.com", first_name: "Radu", last_name: "Craciun", password: "admin123", password_confirmation: "admin123", user_type: "owner")
user.save
