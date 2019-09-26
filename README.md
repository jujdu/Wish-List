# Wish List
A test application for Junior iOS Developer vacancy. The app can get and post data by specified API. To get or send info it uses only POST requests. The main purpose is creating an app like a wish list application. When app is opened the first time, it must
create a session by API and keep it. Each time app sends specified token to API. Also when it has no internet connection, it shows a view with error and button to update. The app must have 3 views:
1) TableView with received data. It must show only 200 characters of a wish.
2) View for creating a new wish.
3) Detail view with full wish text.

It uses Alamofire for web requests, but probably, I should use just URLSession. For parsing it uses Decode.

To try this app need:

1) clone repo.
2) pod install.
