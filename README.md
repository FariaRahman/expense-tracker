# Expense-Tracker
Expense Tracker is a Python application that helps users manage their expenses by allowing them to track their spending across different categories and monitor their budget limits. The application provides features to set up monthly budgets, add expenses for various categories, and generate detailed reports.


## Features

  Set Monthly Budget: Users can set a monthly budget for overall spending.
  
  Category Budgets: Users can set budgets for individual spending categories such as groceries, utilities, entertainment, and custom categories.
  
  Add Expenses: Users can add expenses for each category, including the amount, description, location, and payment method.
  
  Budget Monitoring: The application compares actual expenses with set budgets and provides warnings if budget limits are exceeded.
  
  Detailed Reports: Users can generate detailed reports of expenses within a specified date range and for specific categories.
  
  Export Data: Users can export expense data to CSV or Excel files for further analysis.


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

## Environmental Variables

The application can be configured using the following environmental variables:

HOST: The hostname of the MySQL database.

USER: The username for accessing the MySQL database.

PASSWORD: The password for accessing the MySQL database.

DATABASE: The name of the MySQL database.

## Servers Used

XAMMP SERVER : for mysql

VS CODE : As a editor for python

## Installation

Clone the repository:

```bash
  git clone https://github.com/FariaRahman/expense-tracker.git

```
Navigate to the project directory: 

```bash
  cd expense-tracker

```
Install the required dependencies:

```bash
  pip install -r requirements.txt

```
Configure MySQL database:

Set up a MySQL database and create tables using the provided SQL scripts in the sql directory.

Update the MySQL connection details in the Final Code.py file to match your database configuration.

Run the application:

```bash
  Final Code.py

```
## Usage

Upon running the application, you will be prompted to set the monthly budget and budgets for individual categories.

Follow the on-screen instructions to add expenses, check budgets, generate reports, and export data.

Ensure that you have a MySQL database set up and running before using the application.

## Screenshots
<h1></h1>
<img src-"p2.png">

