// Q1: Did campaigns attract customers to purchase products?

db.messages.aggregate([
  {
    $group: {
      _id: {
        campaign_id: "$campaign_id",
        message_type: "$message_type"
      },
      total_messages: { $sum: 1 },
      purchases: {
        $sum: {
          $cond: [{ $eq: ["$is_purchased", true] }, 1, 0]
        }
      }
    }
  },
  {
    $addFields: {
      conversion_rate_percent: {
        $multiply: [
          { $divide: ["$purchases", "$total_messages"] },
          100
        ]
      }
    }
  },
  {
    $sort: { conversion_rate_percent: -1 }
  }
]);
