*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary

#robot -d results .\Tests\CRM.robot
*** Variables ***



*** Test Cases ***
Should be able to add new customer
    [Documentation]                         This is basic info about the test
    [Tags]                                  1006    Smoke    Contracts
    # Initialize Selenium
    Set Selenium Speed                      0.2s
    Set Selenium Timeout                    10s

    Log                                     Starting the test case
    Open Browser                            https://automationplayground.com/crm/    chrome
    Maximize browser window

    wait until page contains                Customers Are Priority One
    click link                              Sign In
    page should contain                     Login

    input text                              id=email-id       admin@robotframeworktutorial.com
    input text                              id=password        password
    click button                            Submit
    wait until page contains                Our Happy Customers

    click link                              id=new-customer
    wait until page contains                Add Customer

    input text                              id=EmailAddress        test@gmail.com
    input text                              id=FirstName           Jane
    input text                              id=LastName            Doe
    input text                              id=City                Dallas
    select from list by value               id=StateOrRegion        TX
    select radio button                     gender      female
    select checkbox                         name=promos-name

    click button                            Submit
    wait until page contains                Success! New customer added.
    Sleep                                   3s
    Close Browser

*** Keywords ***
