# File Sharing Application - Product Document

## Technical requirements

- You are allowed to use allowed to use gems/libraries for file upload and session management (e.g. paperclip, devise etc).
- Write unit test cases for all model and controller methods using rspec.
- Please make sure that you're using Ruby 2.6.6, Rails 6.0.3.6, and rspec 3.10.x versions.
  - If you were allocated a M1 chip Mac Book and facing issues with ruby/rails setup, please refer to this [document](https://browserstack.atlassian.net/wiki/spaces/ENG/pages/3198550185/Common+railsApp+setup+issues+on+M1+MacBook+with+solutions#Rosetta) for known issues and steps to resolve them.
  - Incase you are still facing issues specific to M1, feel free to join this channel on slack: #help-m1-mac-railsapp-setup and raise issues

## Objective
Build an online file sharing application using Rails.

## Features
**Note:** The UI mock-ups provided here are for ***representational purpose only***. You don’t need to abide by this design, but make sure all of the stated requirements are sufficiently met.

This application should have the following features:

### User Management

#### Sign up

- As a new user, I should be able to register for a new account. The application should ask for the following details about a new user:
  1. Unique username: The application should provide a warning incase the username is already taken.
  2. Email address
  3. Password: The password should contain -
     1. Greater than 8 characters
     2. Include at least one uppercase letter
     3. Include at least one lowercase letter
     4. Include at least one letter

  <img width="1438" alt="Screenshot 2023-02-11 at 4 14 57 AM" src="https://user-images.githubusercontent.com/60533560/218219973-17275479-d12f-4478-a021-c53df91eb768.png">


#### Login

- Once an account is created, a user should be able to login to their account.
  1. If the login is successful: They should be taken to their “File Dashboard” which will serve as their homepage and display the various files associated with their account.
  2. If the login is unsuccessful: Then the following message should be displayed - “Couldn’t find that user! Please try again”

  <img width="1438" alt="Screenshot 2023-02-11 at 4 15 37 AM" src="https://user-images.githubusercontent.com/60533560/218219995-4d64286f-8b42-4b3f-8d3f-40e7311199a9.png">


#### Logout

A logged in user should be able to log out by clicking a button. Once a user is logged out, they should be redirected to the login page.


#### User Profile

- There should be a profile page for every user. They should be able to update various details about their account like:
  1. Name
  2. Email address

  <img width="1438" alt="Screenshot 2023-02-11 at 4 13 11 AM" src="https://user-images.githubusercontent.com/60533560/218220017-2a9e9417-e825-4d16-959f-75f211f88bb0.png">



### File Management

Here are the various features needed for file management:

  - **File Dashboard**: This will contain the various files associated with a user account. The files should be displayed as tiles within a grid. The files should be organized in descending order of upload date, i.e. latest file first. For every file the following details should be displayed:
    1. Name (include extension), e.g. “big_win.pdf”
    2. Upload date: This is the date on which the file has been uploaded. The date should be presented in the format of “<Day> <Month> <Year>” (e.g. 23 May 2018).
  - **File Upload**: A user should be able to click a button which will display a file uploader in the browser and select a file they would like to upload. A user should be able to upload one file at a time.
  - **File Download**: A user should be able to click on the download action next to every file to download the associated file.
  - **File Share**: A user should be able to turn on public sharing of a file using a “ON/OFF” toggle control. Once public sharing is turned on, then a unique URL should be made available next to the toggle button which is publically accessible. The user shouldn’t be able to delete or share this file.
  - **File Deletion**: A user should be able to click on the delete action next to every file to delete the associated file.

 <img width="1438" alt="Screenshot 2023-02-11 at 3 52 12 AM" src="https://user-images.githubusercontent.com/60533560/218220038-10051b2b-2c5d-4cdf-a2c0-a1e5c9bfbe22.png">



### File Sharing

There should be a stand-alone page for a shared file.

  <img width="1438" alt="Screenshot 2023-02-11 at 4 01 50 AM" src="https://user-images.githubusercontent.com/60533560/218220054-a29e471c-379b-44dd-be0c-98f36f14e911.png">

