p "Seeding: #{__FILE__}"

admin = User.find_or_create_by email: "admin@sentia.com.au"
admin.update_attributes firstname: "Admin",
                        surname: "User",
                        password: "password",
                        role: :admin
