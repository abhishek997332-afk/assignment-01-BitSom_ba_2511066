/* MongoDB queries */
// OP1: insertMany() — insert all 3 documents

db.products.insertMany([
{
product_id: "E101",
name: "Smartphone X",
category: "Electronics",
price: 45000,
brand: "TechMobile",
specifications: {
warranty_years: 2,
voltage: "220V",
battery_capacity: "5000mAh"
},
features: ["5G","OLED Display","Fast Charging"]
},

{
product_id: "C201",
name: "Men's Denim Jacket",
category: "Clothing",
price: 3500,
brand: "UrbanWear",
size_options: ["S","M","L","XL"],
material: "Denim",
colors: ["Blue","Black"]
},

{
product_id: "G301",
name: "Organic Almond Milk",
category: "Groceries",
price: 250,
brand: "NatureFresh",
expiry_date: ISODate("2024-12-30"),
nutrition: {
calories: 40,
protein: "1g",
fat: "3g"
}
}
])


// OP2: find Electronics products with price > 20000

db.products.find({
category: "Electronics",
price: { $gt: 20000 }
})


// OP3: find Groceries expiring before 2025-01-01

db.products.find({
category: "Groceries",
expiry_date: { $lt: ISODate("2025-01-01") }
})


// OP4: updateOne() add discount_percent field

db.products.updateOne(
{ product_id: "E101" },
{ $set: { discount_percent: 10 } }
)


// OP5: createIndex on category field

db.products.createIndex({ category: 1 })

// This index improves query performance when filtering products by category
