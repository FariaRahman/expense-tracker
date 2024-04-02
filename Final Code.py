import mysql.connector
from datetime import datetime
import csv
import pandas as pd


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="expense_tracker"
)


mycursor = mydb.cursor()


mycursor.execute("CREATE TABLE IF NOT EXISTS categories (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), budget FLOAT)")
mycursor.execute("CREATE TABLE IF NOT EXISTS expenses (id INT AUTO_INCREMENT PRIMARY KEY, category_id INT, amount FLOAT, description VARCHAR(255), location VARCHAR(255), date DATE, payment VARCHAR(255))")
mycursor.execute("CREATE TABLE IF NOT EXISTS monthly_budget (id INT AUTO_INCREMENT PRIMARY KEY, month_year VARCHAR(7), budget FLOAT)")

class ExpenseCategory:
    def __init__(self, name, budget):
        self.name = name
        self.budget = budget
        self.insert_category_to_db()

    def insert_category_to_db(self):
        sql = "INSERT INTO categories (name, budget) VALUES (%s, %s)"
        val = (self.name, self.budget)
        mycursor.execute(sql, val)
        mydb.commit()
        self.id = mycursor.lastrowid

    def add_expense(self, amount, description, location, payment):
        if self.remaining_budget() >= amount:
            sql = "INSERT INTO expenses (category_id, amount, description, location, date, payment) VALUES (%s, %s, %s, %s, %s, %s)"
            val = (self.id, amount, description, location, datetime.now().date(), payment)
            mycursor.execute(sql, val)
            mydb.commit()
            print("Expense added successfully.")
        else:
            print("Warning: Expense exceeds budget!!!! Expense could not be added.")

    def total_expenses(self):
        sql = "SELECT SUM(amount) FROM expenses WHERE category_id = %s"
        val = (self.id,)
        mycursor.execute(sql, val)
        result = mycursor.fetchone()[0]
        return result if result else 0

    def remaining_budget(self):
        return self.budget - self.total_expenses()

class ExpenseTracker:
    def __init__(self):
        self.categories = []
        self.monthly_budget_set = False
        self.setup_budgets()
        self.compare_expenses_to_budget()

    def set_monthly_budget(self):
        if not self.monthly_budget_set:
            budget = float(input("Enter monthly budget : "))
            month_year = datetime.now().strftime('%Y-%m')
            sql = "INSERT INTO monthly_budget (month_year, budget) VALUES (%s, %s)"
            val = (month_year, budget)
            mycursor.execute(sql, val)
            mydb.commit()
            print("Monthly budget set successfully.\n")
            self.monthly_budget_set = True

    def setup_budgets(self):
        print("Please set up budgets for each category:")
        for category_name in ["Groceries", "Utilities", "Entertainment", "Custom"]:
            budget = float(input(f"Enter budget for {category_name}: "))
            self.add_category(ExpenseCategory(category_name, budget))
        print("Budgets has been added.\n")

    def add_category(self, category):
        self.categories.append(category)

    def select_category(self):
        print("Select a category:")
        for i, category in enumerate(self.categories, 1):
            print(f"{i}. {category.name}")
        while True:
            choice = input("Enter category number: ")
            if choice.isdigit():
                choice = int(choice)
                if 1 <= choice <= len(self.categories):
                    return self.categories[choice - 1]
            print("Invalid choice. Please enter a valid number for the  desired category.")

    def add_expense(self):
        category = self.select_category()
        amount = float(input(f"Enter amount for {category.name} expense: "))
        if category.total_expenses() + amount > category.budget:
            print("Error: Adding this expense exceeds the monthly budget")
            return
        description = input("Enter description: ")
        location = input("Enter location: ")
        payment = input("Enter payment method: ")
        category.add_expense(amount, description, location, payment)

    def check_budget(self, category_name):
        for category in self.categories:
            if category.name == category_name:
                remaining = category.remaining_budget()
                if remaining >= 0:
                    print(f"Your remaining budget for {category_name} is : ${remaining}  ")
                else:
                    print(f"Warning: You have exceeded {category_name} budget by ${-remaining}!")
                return
        print("Category not found!")

    def compare_expenses_to_budget(self):
        print("\nShowing your expenses and budgets now available:")
        category_totals = []
        for category in self.categories:
            total_expense = category.total_expenses()
            category_totals.append((category.name, total_expense))
            remaining = category.remaining_budget()
            if remaining < 0:
                print(f"Warning: You have exceeded the budget for {category.name} by {abs(remaining)}!")
            else:
                print(f"You are within the budget for {category.name}. You have {remaining} left.")
        
        total_expense = sum(expense for _, expense in category_totals)
        total_budget = sum(category.budget for category in self.categories)
        remaining_budget = total_budget - total_expense

        print("\nDashboard:")
        print(f"Total Expense: ${total_expense}")
        print(f"Remaining Budget: ${remaining_budget}")

        print("\nCategory-wise total expenses:")
        for category_name, total_expense in category_totals:
            print(f"{category_name}: ${total_expense}")


    def generate_detailed_report(self, start_date, end_date, category_name):
        sql = "SELECT c.name AS category, e.amount, e.description, e.location, e.date, e.payment FROM expenses e JOIN categories c ON e.category_id = c.id WHERE e.date BETWEEN %s AND %s"
        params = (start_date, end_date)
        if category_name:
            sql += " AND c.name = %s"
            params += (category_name,)
        mycursor.execute(sql, params)
        result = mycursor.fetchall()
        return result
    
    def export_to_csv(self, data, filename):
        try:
            with open(filename, 'w', newline='') as csvfile:
                csv_writer = csv.writer(csvfile)
                csv_writer.writerow(['Category', 'Amount', 'Description', 'Location', 'Date', 'Payment'])
                csv_writer.writerows(data)
            print(f"Data exported to {filename} successfully!")
        except Exception as e:
            print(f"Error exporting to CSV: {e}")

    def export_to_excel(self, data, filename):
        try:
            df = pd.DataFrame(data, columns=['Category', 'Amount', 'Description', 'Location', 'Date', 'Payment'])
            df.to_excel(filename, index=False)
            print(f"Data exported to {filename} successfully!")
        except Exception as e:
            print(f"Error exporting to Excel: {e}")        

           

tracker = ExpenseTracker()
tracker.set_monthly_budget()
tracker.add_expense()

tracker.check_budget("Groceries")
tracker.check_budget("Utilities")
tracker.check_budget("Entertainment")
tracker.check_budget("Custom")
tracker.compare_expenses_to_budget()


start_date = input("Enter start date (YYYY-MM-DD): ")
end_date = input("Enter end date (YYYY-MM-DD): ")
category_name = input("Enter category name (leave empty for all categories): ")


detailed_report_data = tracker.generate_detailed_report(start_date, end_date, category_name)

if detailed_report_data:  # Check if report data is not empty
    export_format = input("Export format (CSV or Excel): ").lower()
    if export_format == 'csv':
        filename = input("Enter filename for CSV export: ")
        tracker.export_to_csv(detailed_report_data, filename)
    elif export_format == 'excel':
        filename = input("Enter filename for Excel export: ")
        tracker.export_to_excel(detailed_report_data, filename)
    else:
        print("Invalid export format. Please choose either CSV or Excel.")
else:
    print("No expenses found for the selected criteria.")