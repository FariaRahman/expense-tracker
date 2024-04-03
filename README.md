# Expense-Tracker
a brief description of how I have created this Tracker , what it does and who can use it
## API Reference

#### Get all items




```http
  GET /api/Attributes
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |
| `amount`      | `string` | **Required**. amount of items to fetch |
| `category`      | `string` | **Required**. categories of items to fetch |
| `Payment`      | `string` | **Required**. payment method of items to fetch |
| `budget`      | `string` | **Required**. seting budgets of items |

#### SUM(Amount)

sums up the amounts for all the categories and also sums up the amounts for each category
