*** Settings ***

Library    SeleniumLibrary
Library    RPA.Cloud.Google
Library    ExcelLibrary
Library    String
Library    RequestsLibrary
Library    D:/Moolyaed/Robot_Framework/Flipkart/CustomLibrary/Api.py
Resource    ../Variables/variables.robot

*** Keywords ***

Launching Url And Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
Dismissing The Login Pop-up In The Home Page
    
    Wait For Element And Click    ${DissmissPopup}

Mouse Over On Fashion Icon And Selecting Men's T-shirt From The List 
    Mouse Over    ${Fasion}
    Wait For Element And Click    ${Men'sTshirts}
   
Selecting The T-shit From The Collection   
    
    Wait Until Element Is Visible    ${SelectShirt}
    Scroll Element Into View    ${SelectShirt}
    Wait For Element And Click    ${SelectShirt}

After Selecting The T-Shirt Switching To New Tab 
    ${Window}    Get Window Handles
    Switch Window    ${Window}[1]
       
Opening The Size Chart Table Of The T-Shirt
    Wait For Element And Click    ${SizeChart}
    
Getting Shirt Size From The Table By Doing Itteration
    ${Row_Count}=    Get Element Count    ${RowCount}
    ${Coloum_Count}=    Get Element Count    ${ColoumCount}
    Log To Console    ${Row_Count}
    Log To Console    ${Coloum_Count}
    
    FOR    ${Row_Index}    IN RANGE    1    ${Row_Count} + 1
         ${Row_Content}    Get Text    xpath://*[@class='_2WObml']//tr[${Row_Index}]//td
        Run Keyword If    "${Row_Content}" == "${ExpectedTitle}"   Exit For Loop   
    END
    Log To Console    ${Row_Index}
    FOR    ${Coloum_Index}    IN RANGE    1    ${Coloum_Count} + 1 
         ${current_data}=    Get Text    xpath://*[@class='_2WObml']//tr[${Row_Index}]//td[${Coloum_Index}]
        
        IF    "${Current_Data}" == "${ExpectedData}"
             ${Length}=    Get Text    xpath://*[@class='_2WObml']//tr[${row_index}]//td[4]
            Log To Console    ${Coloum_Index}
            Log To Console    ${Current_Data}
            Log To Console    ${Length}
        ELSE
            Log To Console    ${Current_Data}
            
        END            
        Run Keyword If    "${Current_Data}" == "${ExpectedData}"    Exit For Loop
        
    END
    
Closing The Size Chart Table 
    Wait For Element And Click    ${CloseChart}
    
Selecting M-Size For The T-Shirt 
   
    Wait For Element And Click    ${M}
    Wait Until Element Is Visible    ${M}
    Mouse Over    ${M}
    ${M_Text}=    Get Text    ${M}
    Log To Console    ${M_Text} 
   
Comparing M Size T-Shirt With Size Chart Value   
    Element Text Should Be    ${SizeM}    Chest 38 inch | Length 28 inch 

Adding T-Shirt To The Cart   
    Wait For Element And Click    ${Add_To_Cart}

After Adding T-Shirt To Cart Switching Back To Parent Tab
    ${Window}    Get Window Handles
    Switch Window    ${Window}[0]

## Excel ##

Fetching Data From Excel And Sending Into SearchBar

    ${ProductName}    Read Excel    ${Xlsx_Path}    Sheet1    2    1
    Log To Console    ${ProductName}
    Input Text    ${SearchBar}    ${ProductName}
    Wait For Element And Click    ${SearchButton}
    
    ${ProductName}    Read Excel    ${Xlsx_Path}    Sheet1    3    1
    Log To Console    ${ProductName}
    Wait Until Element Is Visible    ${SearchBar}
    Clear Element Text    ${SearchBar}
    Input Text    ${SearchBar}    ${ProductName}
    Wait For Element And Click    ${SearchButton}
    

Read Excel
    [Arguments]    ${filepath}    ${sheetname}    ${rownum}    ${coloumnum}
    Open Excel Document    ${filepath}    1
    Get Sheet    ${sheetname}
    ${data}       Read Excel Cell    ${rownum}    ${coloumnum}
    [Return]    ${data}
    Close Current Excel Document


## Google Sheet ##

Adding Values To Google Sheet
    ${values}    Evaluate    ${ProductNames}    
    Insert Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}    ${values}    ROWS

Fetching Data From Google Sheet And Sending Into SearchBar 
    
    ${spreadsheet_content}=    Get Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}
    IF    "values" in ${spreadsheet_content}
        FOR    ${Row_Count}    IN RANGE    0    5   1
            Log To Console    ${Row_Count}
             ${JsonToString_Values1}    Convert To String    ${spreadsheet_content["values"][${Row_Count}]}
             ${Values2}    Remove String    ${JsonToString_Values1}    [    ]    '    '
             Clear Element Text    ${SearchBar}
             Wait For Element Visibility And Input The Text   ${SearchBar}    ${Values2}
             Wait For Element And Click    ${SearchButton}
            Log To Console    ${Values2}
        END
        
    END

Clearing Values In Google Sheet
    Clear Sheet Values    ${SHEET_ID}    ${SHEET_RANGE}


### CoinSwitch ###

Click On Trade Button 
    Go To    ${url1}
    Wait For Element And Click    ${TradeNow_Button}

Dismissing PopUp's Present In The Home Page
    Wait For Element And Click    ${PopUp_ClickOn_SkipAll}
    Wait For Element And Click    ${Done}

Fetching And Storing The Particular Value From Bids , Finally Comaparing With Response Content
    Scroll Element Into View    ${OrderBook}
    Wait For Element And Click    ${OrderBook}
    Scroll Element Into View    ${Limit_Price}
    ${GetValues}    Get Value    ${Limit_Price}
    Log To Console    ${GetValues}

    # Request Session
    Create Session    Session    ${url1}
    ${Response}    Get Request    Session    ${Path1}   
    ${Response1}    Evaluate    json.loads('''${Response.content}''')    json
    Log To Console    json_value:\t ${Response1['data']['bids'][0][0]}
    

    FOR    ${BidsResponse}    IN RANGE    0    10    1
         ${Response_Value}    Convert To String    ${Response1['data']['bids'][${BidsResponse}][0]}
         Log To Console    String_value:\t ${Response_Value}
        
        IF    '${Response_Value}' == '${GetValues}'
             Log To Console    Values Are Matched :\t Bids Matched Values Are :\t ${Response_Value}\t ${GetValues}
        ELSE
             Log To Console    Values Are Not Matched :\t Bids Matched Values Are :\t ${Response_Value}\t ${GetValues}
    
        END
        Run Keyword If    '${Response_Value}' == '${GetValues}'    Exit For Loop
    END
    
    Should Be Equal    ${Response_Value}    ${GetValues}

Fetching And Storing The Particular Value From Asks , Finally Comaparing With Response Content
    Scroll Element Into View    ${Sell_Price}
    Wait For Element And Click    ${Sell_Price}
    Scroll Element Into View    ${Limit_Price}
    ${GetValues1}    Get Value    ${Limit_Price}
    Log To Console    ${GetValues1}   

    #Request Session
    Create Session    Session    ${url1}
    ${Response}    Get Request    Session    ${Path1}   
    ${Response1}    Evaluate    json.loads('''${Response.content}''')    json
    Log To Console    json_value:\t ${Response1['data']['asks'][0][0]}
    

    FOR    ${AsksResponse}    IN RANGE    0    10    1
         ${Response_Value}    Convert To String    ${Response1['data']['asks'][${AsksResponse}][0]}
         Log To Console    String_value:\t ${Response_Value}
        
        IF    '${Response_Value}' == '${GetValues1}'
             Log To Console    Values Are Matched :\t Asks Matched Values Are :\t ${Response_Value}\t ${GetValues1}
        ELSE
             Log To Console    Values Are Not Matched :\t Asks Matched Values Are :\t ${Response_Value}\t ${GetValues1}
        END
        Run Keyword If    '${Response_Value}' == '${GetValues1}'    Exit For Loop
    END
    
    #validation
    Should Be Equal    ${Response_Value}    ${GetValues1}

###Api CoinSwitch Custom Library ###

Click On Trade Button And Dismissing PopUp's Present In The Home Page 
    Go To    ${url1}
    Wait For Element And Click Element    ${TradeNow_Button}    ${PopUp_ClickOn_SkipAll}    ${Done}

Fetching And Storing The Particular Value From Bids, Finally Comaparing With Response
    
    Wait For Element Scroll To View And Clickon Element    ${OrderBook}
    ${GetValues}    Wait For Element Scroll To View And Get Text    ${Limit_Price}
    Log To Console    ${GetValues}
  
    
    ${request}    Request    ${url2}    ${GetValues} 
    Log To Console    ${request}
    Should Be Equal    ${GetValues}    ${request}    
    Log To Console    Values Are Matched :\t Asks Matched Values Are :\t ${request}\t ${GetValues}


Wait For Element And Click
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}    timeout=10s
    Click Element    ${element}

Wait For Element Visibility And Input The Text
    [Arguments]    ${element1}    ${element2}
    Wait Until Element Is Visible    ${element1}    timeout=10s
    Input Text    ${element1}    ${element2}