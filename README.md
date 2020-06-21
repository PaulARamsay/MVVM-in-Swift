# MVVM in Swift!

Welcome to MVVM for swift. This is a super basic implementation of how you can adopt MVVM. The example provided access Lothian Buses API for bus services and displays an array of services  in a tableview.

## How to get started

All you need for this example is XCode 11.2, and a basic knowledge of swift. Simply run the XCode project file and you're on your way. 

### How MVVM works 

MVVM is the idea of seperating business logic from the view manipulation. You can split up your code into 3 main classes.

- Model

- View (View Controller)

- View Model

### So how does that compare to our example?

Quite simply when we create our view controller, we pass in a view model. The view model fetches our data and tells the view controller to update the user interface - or in our case, reload the table view. 

We can also update the UI based on failure. If we can't download our data, or we're having issues decoding the class, we can also update the UI based on failure. For instance we could show an alert, pop the view and much much more. 

