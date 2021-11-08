# MidtermProject

# Overview
This is a team project. In this project, we created a food pantry project called "Helping Hand." The project allows both a login for providers(pantries) and recipients(those who may need to receive assistance/food from a local pantry) and associated CRUD functions where applicable for both.  

# How to Use
In your browser, please entering the following AWS IP and address: http://18.118.127.156:8080/HelpingHand.  On the Home page, options are displayed in the navigation bar for Login as well as Logout.  Clicking Login, for the Username for "Login as Recipient" please use "rlarson" with the password "ralphlarson" and click Login as Recipient. He is one of several recipients in our database.  

Recipient access allows a user to be able to find a pantry close to him/her based on zipcode.  Additional options on the page allow for showing an order history once generated from the pantry as well as returning to home.  Enter a zipcode into the search for finding a pantry.  The site will then provide you with the ability to see the MICA food pantry's inventory which they shared to our site.  Click "Show Inventory" and the items the pantry currently has are displayed.  Selecting "Add to Cart" for any items of interest and then "Items in Cart" will take you to a page to show your order/cart.

From there, if you click "Place Your Order" to schedule the appointment from the pantry for local pickup or if you made a mistake, you can either "Delete" the choice.  If you choose "Return to List" you can select additional items from the list as needed.  

The Appointment page lets you select from a calendar for the Date and Time (Local Date Time) and then "Submit Appointment." When the appointment is entered a confirmation form is provided on screen with the date time and the pantry address.  You can then choose to return to the Recipient or Home pages.  The site requires once the recipient has finished to then provide a provider's username and password.

Selecting "Login" from the navigation pane, enter "atate" as the username and "anntate" as the password followed by "Login as Provider."  The Provider access page allows for finding all appointments for the pantry, showing what items at the pantry are currently out of stock,  and refilling inventory for the pantry (under the assumption that the inventory items being provided are staples and are replenished frequently). Each of the respective pages allows for a return to the Provider page or to return Home.  Lastly, Logout from the navigation pane will end the current session.

Thank you for reviewing our project.  We hope you enjoyed it as much as we did creating it!

# Technologies Used

* Spring Boot
* Kanban board (Trello)
* MySQL Workbench
* AWS
* Figma (Wireframes)
* JPQL
* Git Branching
* Agile
* HTML 5
* CSS
* Bootstrap

# Lessons Learned
In this project, we have tables inventory_item and shopping_cart_item with one-to-one relationship. When we tried to select items form inventory_item and add them to shopping_cart_item, mysql produced duplicate data in shopping_cart_item table for some reason. This caused to 'More than one rom with the given identifier was found error'. Similar issues might happen to the table appointment and cart which has one-to-one relationship. To solve this, we need to delete the duplicate data from the database: the shopping_cart_item and appointment tables.
