require "faker"

AdminUser.destroy_all
Category.destroy_all
Item.destroy_all
Province.destroy_all

if Rails.env.development?
  AdminUser.create!(email:                 "admin@example.com",
                    password:              "password",
                    password_confirmation: "password")
end

Province.create(name: "Alberta",
                gst:  0.05,
                pst:  0,
                hst:  0)

Province.create(name: "British Columbia",
                gst:  0.05,
                pst:  0.07,
                hst:  0)

Province.create(name: "Manitoba",
                gst:  0.05,
                pst:  0.07,
                hst:  0)

Province.create(name: "New Brunswick",
                gst:  0,
                pst:  0,
                hst:  0.15)

Province.create(name: "Newfoundland and Labrador",
                gst:  0,
                pst:  0,
                hst:  0.15)

Province.create(name: "Northwest Territories",
                gst:  0.05,
                pst:  0,
                hst:  0)

Province.create(name: "Nova Scotia",
                gst:  0,
                pst:  0,
                hst:  0.15)

Province.create(name: "Nunavut",
                gst:  0.05,
                pst:  0,
                hst:  0)

Province.create(name: "Ontario",
                gst:  0,
                pst:  0,
                hst:  0.13)

Province.create(name: "Prince Edward Island",
                gst:  0,
                pst:  0,
                hst:  0.15)

Province.create(name: "Quebec",
                gst:  0.05,
                pst:  0.9975,
                hst:  0)

Province.create(name: "Saskatchewan",
                gst:  0.05,
                pst:  0.06,
                hst:  0)

Province.create(name: "Yukon",
                gst:  0.05,
                pst:  0,
                hst:  0)

4.times do
  category = Category.create(name:        Faker::Commerce.unique.department,
                             description: Faker::Company.bs)
  # populate category with products
  25.times do
    category.items.build(name:        Faker::Commerce.unique.product_name,
                         description: Faker::Commerce.material,
                         price:       Faker::Commerce.price,
                         markdown:    0)
    category.save
  end
end
