#!/usr/bin/env python
# coding: utf-8

# In[1]:


import db
from objects import Product

def display_title():
    print("Product Manager")
    print()    

def display_categories():
    categories = db.get_categories()
    print("CATEGORIES")
    names = categories[0].name + "  |  " + categories[1].name + "  |  " + categories[2].name
    print(names)
    print()

def display_menu():
    print("COMMAND MENU")
    print("view   - View products by category")
    print("update - Update product price")
    print("exit   - Exit program")
    print()    

def display_products_by_category():
    category_name = input("Category name: ")
    line_format = "{:15s} {:65s} {:45s}"
    print(line_format.format("Code", "Name", "Price"))
    print("-" * 95)
    products = db.get_products_by_category(category_name)
    for product in products:
        print(line_format.format(product.code, product.name, "{:,.2f}".format(product.price)))
    print()
    
def update_product():
    code = input("Product code: ")
    price = float(input("New product price: "))
    db.update_product(code, price)
    print("Product updated.\n")
        
def main():
    db.connect()
    display_title()
    display_categories()
    display_menu()
    while True:        
        command = input("Command: ")
        if command == "view":
            display_products_by_category()
        elif command == "update":
            update_product()
        elif command == "exit":
            break
        else:
            print("Not a valid command. Please try again.\n")
            display_menu()
    db.close()
    print("Bye!")

if __name__ == "__main__":
    main()


# In[ ]:




