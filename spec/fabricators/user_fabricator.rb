Fabricator(:user) do
  email    { Faker::Internet.email }
  password { "apples" }

end
