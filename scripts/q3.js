// Q3: Full text search on product categories

db.products.find(
  { category_code: { $regex: "vacuum", $options: "i" } },
  {
    product_id: 1,
    category_code: 1,
    brand: 1,
    price: 1
  }
).limit(10)
