use ecommerce

print("Loading MongoDB collections...")

db.events.insertMany(
  JSON.parse(cat("data/cleaned/events.csv"))
)

db.campaigns.insertMany(
  JSON.parse(cat("data/cleaned/campaigns.csv"))
)

db.messages.insertMany(
  JSON.parse(cat("data/cleaned/messages.csv"))
)

db.friends.insertMany(
  JSON.parse(cat("data/cleaned/friends.csv"))
)

db.client_first_purchase.insertMany(
  JSON.parse(cat("data/cleaned/client_first_purchase_date.csv"))
)

print("MongoDB data loading completed.")
