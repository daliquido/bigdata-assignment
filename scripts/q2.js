// Q2: Find top recommended products based on user interactions

db.events.aggregate([
  {
    $group: {
      _id: "$product_id",
      interaction_count: { $sum: 1 }
    }
  },
  {
    $sort: { interaction_count: -1 }
  },
  {
    $limit: 10
  }
]);
