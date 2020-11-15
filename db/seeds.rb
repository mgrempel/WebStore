require "faker"

AdminUser.destroy_all
Category.destroy_all
Item.destroy_all

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end

4.times do
  category = Category.create(name:        Faker::Commerce.unique.department,
                             description: Faker::Company.unique.bs)
  # populate category with products
  25.times do
    category.items.build(name:        Faker::Commerce.unique.product_name,
                         description: Faker::Commerce.material,
                         price:       Faker::Commerce.price)
    category.save
  end
end
