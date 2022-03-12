# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create test containers and items:
p 'Start Seeding!'
container = Container.create(description: 'Test container from seeds file')
item_1 = Item.create(description: 'First test item from seeds file')
item_2 = Item.create(description: 'Second test item from seeds file')
Content.create(container_id: container.id, item_id: item_1.id, quantity: 100)
Content.create(container_id: container.id, item_id: item_2.id, quantity: 50)


p 'Seed process over'
