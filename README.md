# Positive Banking

Allows users to submit 3 inputs
1. Average Balance in USD (2 decimal places)
2. Transaction 1 in USD (2 decimal places)
3. Transaction 2 in USD (2 decimal places)

Generates 2 outputs of:
1. Good Shares
    a. Dollar Value of Ownership (Calculated as the lower of ($1000 OR Average Balance) multiplied by 0.5%)
2. Good Impact
    a. Acres (Calculated as the sum of transactions multiplied by 0.03)
    b. Trees (Calculated as the Acres multiplied by 900 and rounded to the nearest integer)
    c. Animals (Calculated as the Acres multiplied by 12000 and rounded to the nearest integer)


## Running the Application

1. Install Flutter in your system - https://flutter.dev/docs/get-started/install
2. Following the above link, choose your platform and setup iOS/Android simulator
3. Checkout the github project to your local system
4. cd into the app directory 
5. Ensure that the simulator is running
6. enter the command in terminal `flutter run`

## Assumptions

1. **Dollar Value of Ownership** under **Good Shares** is presented in decimals after multiplying with 0.005 (0.5%)

## Error Handling

1. To prevent adding incorrect inputs, all the 3 user inputs are restricted to only digits, limited to 2 decimal places
2. To prevent adding partial inputs, submit is disabled until user adds both the transaction inputs to generate the **Good Impact**