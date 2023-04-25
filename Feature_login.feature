Feature: Login

Scenario: User should be able to register as a new user

Given User has verified contact_number, valid Name and valid email_id
When user gives valid input to register api
Then user should be able to create new account.


Scenario: Error message for existing user who tries to register

Given an exister User has verified contact_number, valid Name and verified email_id
When user gives valid input to register api
Then message 'Email ID is already registered with furlenco' should be displayed to the user.


Scenario: Error message for a new user who tries to register with existing email_id

Given a new User has verified contact_number, valid Name and existing email_id
When user gives valid input to register api
Then message 'Email ID is already registered with furlenco' should be displayed to the user.


Scenario Outline: verify error messages for invalid input for registration

Given User has invalid "<contact_number>", invalid "<Name>" and invalid "<email_id>"
When user gives valid input to register api
Then user should be able to create new account.

Examples:
| contact_number | Name | email_id | Resolution message |
| 56789  | test  | ythyh@gmail.com  | Inavlid contact number|
|9663227828 |  | ythyh@gmail.com | Name can't be blank |
|7676670005 | hjjkj | dhj@gmailcom | Validation failed. Email not valid |


Scenario: Verify account of a user with contact_number

Given User has a valid 10 digit contact_number
When user gives valid contact_number to verify account api
Then OTP should be generated to corresponding contact_number 


Scenario: Verify account of a user with email_id

Given User has a valid email_id
When user gives valid email_id to verify account api
Then OTP should be generated to corresponding email_id 


Scenario Outline: Verify error message for invalid input for verify account 

Given User has a invalid "<account>"
When user gives invalid account to verify account api
Then message 'Invalid account value' should be displayed to the user

Examples:
| account | Message |
| 2987612345 | Invalid account value |
| 9987 | Invalid account value |
| kkl | Invalid account value |
| dhivyagamilcom | Invalid account value |


Scenario: Verify whether user is able to verify OTP for contact_number

Given User has OTP generated for respective contact_number
When user enters contact_number and OTP 
Then User should be able to verify contact_number


Scenario: Verify whether user is able to verify OTP for email_id

Given User has OTP generated for respective email_id
When user enters email_id and OTP 
Then User should be able to verify email_id


Scenario Outline: Verify the error message displayed for invalid input in verify OTP

Given User has a verified "<account>"
When user enters incorrect "<OTP>" value
Then message 'Incorrect or Expired OTP' should be displayed to the user.

Examples:

| account | OTP |
| 9663227828 | 789 |
| dhivyan2202@gmail.com | 8790 |


Scenario Outline: Verify the error message displayed for expired OTP

Given User has a verified "<account>"
When user enters expired "<OTP>" value
Then message 'Incorrect or Expired OTP' should be displayed to the user.

Examples:

| account | OTP |
| 9663227828 | 9890 |
| dhivyan2202@gmail.com | 9800 |


Scenario: Verify user is able to delete an active token

Given user has a valid active token
When user enters token value in logout api
Then token should be deleted 


Scenario: Verify whether error message is displayed when user try to delete a expired session

Given user has a valid expired token
When user enters token value in logout api
Then message 'Session Expired. Please login again' should be displayed

