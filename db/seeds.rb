puts "Destroy all users"
User.destroy_all
puts "Create users"
User.create email: "admin@example.com", name: "Admin", password: "12345678",
  password_confirmation: "12345678", role: :admin
User.create email: "korean@example.com", name: "Korean User", password: "12345678",
  password_confirmation: "12345678", role: :moderator
User.create email: "vietnamese@example.com", name: "Vietnamese User", password: "12345678",
  password_confirmation: "12345678", role: :moderator
User.create email: "english@example.com", name: "English User", password: "12345678",
  password_confirmation: "12345678", role: :moderator

puts "Destroy all languages"
Language.destroy_all
puts "Create languages"
Language.create name: "Tiếng Việt", short_name: "vi"
Language.create name: "한국어", short_name: "kr"
Language.create name: "English", short_name: "en"
