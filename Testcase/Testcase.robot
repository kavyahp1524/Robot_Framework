*** Settings ***
Documentation    Flipkart
Resource    ../Keyword/keyword.robot

Suite Setup    Launching Url And Browser
Suite Teardown    Close Browser

*** Test Cases ***

Tc1 : Verfying If User Able To Navigate To The Particular Product.
    
    [Documentation]    Navigating To The Particular Website And Dismissing Pop-up.
    [Tags]    Sanity
    [Setup]    Log To Console    ${StartMessage}

    Given Dismissing The Login Pop-up In The Home Page 
    When Mouse Over On Fashion Icon And Selecting Men's T-shirt From The List
    Then Selecting The T-shit From The Collection 

    [Teardown]    Log To Console    ${EndMessage}

TC2 : Verfying If User Able To Select The T-Shirt Size.
    
    [Documentation]    Selecting T-Shirt Size From The Table.    
    [Tags]    Sanity
    [Setup]    Log To Console    ${StartMessage1}

    Given After Selecting The T-Shirt Switching To New Tab 
    And Opening The Size Chart Table Of The T-Shirt
    When Getting Shirt Size From The Table By Doing Itteration 
    Then Closing The Size Chart Table

    [Teardown]    Log To Console    ${EndMessage1}

TC3 : Verfying If User Able To Select T-Shirt Size. 
    
    [Documentation]    Selecting And Comapring M Size T-Shirt With Size Chart Value, Finally Moving T-Shirt To Cart.  
    [Tags]    Sanity
    [Setup]    Log To Console    ${StartMessage2}
    Given Selecting M-Size For The T-Shirt
    When Comparing M Size T-Shirt With Size Chart Value
    Then Adding T-Shirt To The Cart
    [Teardown]    Log To Console    ${EndMessage2}

TC4 : Verfying If User Able To Search Particular Product By Sending Text To SearchBar.

    [Documentation]    Searching Particular Product By Sending Text To SearchBar.   
    [Tags]    Regression
    [Setup]    Log To Console    ${StartMessage3}
    Given Dismissing The Login Pop-up In The Home Page
    Then Fetching Data From Excel And Sending Into SearchBar
    [Teardown]    Log To Console    ${EndMessage3}

TC5 : Verfying If User Able To Search Particular Product By Sending Text To SearchBar.

    [Documentation]    Searching Particular Product By Sending Text Using GoogleSheet To SearchBar.   
    [Tags]    Regression
    [Setup]    Init Sheets    Keys.json

    #Given Dismissing The Login Pop-up In The Home Page
    When Adding Values To Google Sheet
    And Fetching Data From Google Sheet And Sending Into SearchBar
    Then Clearing Values In Google Sheet

    [Teardown]    Log To Console    ${EndMessage3}

TC6 : Verfying If User Able To Navigate To The Particular Website .
    
    [Documentation]    Navigating To The Particular Website And Fetching Bids Value .
    [Tags]    CoinSwitch
    [Setup]    Log To Console    ${StartMessage4}
    
    Given Click On Trade Button 
    And Dismissing PopUp's Present In The Home Page 
    When Fetching And Storing The Particular Value From Bids, Finally Comaparing With Response Content
    #And Fetching And Storing The Particular Value From Asks, Finally Comaparing With Response Content
    [Teardown]    Log To Console    ${EndMessage4}

TC7 : Verfying If User Able To Navigate To The Particular Website Using Custom Library.
    
    [Documentation]    Navigating To The Particular Website And Fetching Bids Value .
    [Tags]    CoinSwitch
    [Setup]    Log To Console    ${StartMessage4}
    
    #Given Click On Trade Button And Dismissing PopUp's Present In The Home Page
    And Fetching And Storing The Particular Value From Bids, Finally Comaparing With Response

    [Teardown]    Log To Console    ${EndMessage4}