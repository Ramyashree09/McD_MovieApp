#  MCD_MovieAppAssigment
This application features users to get information of list of Movies available.

#Description
The characters and quotes of respective Movie can also be refered through this app.
This app is implemented in SwiftUI and swift adapting the MVVM architecture.

#Getting Started
Make sure you have an Xcode 16.4(latest prefered) installed on your computer.
Download "MCD_MovieAppAssigment" project files from the repo.
Install Cocopods.
Run pod install so you can install the dependencies in your project.
Open the project files in Xcode.
Review the code to undertand the project workflow.
Run active scheme to get the app launched.

#Usage
To get detailed info of the movies along with its avaialble characters and quotes details. Run the project, launch app to function the fetaures as mentioned above.

#Architecture
The app is designed following the MVVM pattern
Model consists of neceesary data and the business logic to handle the details.
View is responsible for displaying/handling the UI/UX for the app.
Controller controls the any data upadtions and updates the Model and View accordingly.
ViewModel binds the data thats requitred for accessing the data.

#Structure
APIServiice contains the communication to server to fetch the data by using API urls provided.
Constants hold the constant stings represents in the code.
View hold the  UI/UX of the app
ViewModel syncs between Model and View if the data gets refreshed or updated.
Extensions contains the files that consists of code snippets for handling the accessiblity.
Mock Data handels the list of API data provided to achieve mapping using the MockClasses.
FeatureFlag consists of displayinh quotes based on whether the certains conditions 
Utility and Reachability provided the Loading view and network handlong respectively.

#Running the tests
This app can be tested using the built in framework in Xc-Test
To start testing the project, you will need to create the test taget in Xcode and then add files along with tests to target.
The test function is written using the XCTest.

#Dependencies
Cocopods is a manadatory and considered as dependency manager.

