*** Variables ***

${url}    https://www.flipkart.com/
${browser}    chrome
${url1}    https://coinswitch.co/pro/
${url2}    https://coinswitch.co/pro/api/v1/realtime-rates/depth?symbol=btc,inr&exchange=csx

${Path1}    /api/v1/realtime-rates/depth?symbol=btc,inr&exchange=csx


### Home_page_Xpath ###

# Dismissing the pop-up
${DissmissPopup}    xpath://button[@class='_2KpZ6l _2doB4z']

# Mouse over to Fashion icon 
${Fasion}    xpath://div[contains(text(),'Fashion')]

# Searching for Product
${Men'sTshirts}    xpath:(//*[@class='_6WOcW9 _3YpNQe'])[2]    

#Xpath_for_Scroll operation
${SelectShirt}    xpath://*[contains(text(),'Pack of 3 Men Printed Round Neck Multicolor T-Shirt')]
${SelectShirt1}    xpath://*[@data-id='TSHGBKQGPWPGFBMJ']

# size_chart_Xpath  
${SizeChart}    //span[contains(text(),'Size Chart')]   


### Table_Xpath ###

# Row And Coloum_Xpath #
${RowCount}    xpath://*[@class='_2WObml']/tbody/tr 
${ColoumCount}    xpath://*[@class='_2WObml']//tr[1]//td

# Titles
${ExpectedTitle}    M 
${ExpectedData}    38

# Close_Size_Chat_Xpath
${CloseChart}    xpath://button[@class='_2KpZ6l _1KAjNd']

# Xpath_For_M_Size
${M}    xpath://*[@id='swatch-2-size']
${SizeM}    xpath:(//*[@class='_3Oikkn _3_ezix _2KarXJ _31hAvz'])[13]
${Add_To_Cart}    xpath:(//*[@class='col col-6-12'])[1]


# Xpath For Search Bar # 
${SearchBar}    Xpath://input[@title='Search for products, brands and more']
${SearchButton}    Xpath://button[@type='submit']  

# Excel Sheet Path #
${Xlsx_Path}    ${CURDIR}${/}../TestData/Product_Name.xlsx

# Google Sheet #
${SHEET_ID}         1spW2i71VhNdIkUp-BBcRTl9tlRXg0U795KdHDnWM2c4
${SHEET_RANGE}      Sheet1!A1:A7
${ProductNames}    [["Pen"],["Glass"],["iphone 14 pro max"],["Kurthis"],["InkPens"]]



### CoinSwithch Xpath ###

# Trade Buttton Xpath #
${TradeNow_Button}    //*[contains(text(),'TRADE NOW')]

# Home Page Content Xpaths
${PopUp_ClickOn_SkipAll}    //*[contains(text(),'Skip All')]
${Done}    //*[contains(text(),'Done')]
${OrderBook1}    //*[@class='tw-p tw-relative tw-mb-[1px] tw-flex tw-w-full tw-cursor-pointer tw-border-gray-800 tw-text-xxs lg:tw-border-r lg:tw-p-1 lg:tw-text-xs']
${Limit_Price}    //*[@id='limit_price']
${Sell_Price}    xpath:(//*[@class='tw-flex-1 tw-text-left tw-text-gray-400 lg:tw-text-center'])[11]
${OrderBook}    (//*[@class='tw-relative tw-cursor-pointer'])[13]


## Setup and Teardown Message ##

# TC1
${StartMessage}    Navigating To The Particular Website And Dismissing Pop-up.
${EndMessage}    Successfully Navigated To The Particular Website And Dismissed Pop-up.
# TC2
${StartMessage1}    Selecting T-Shirt Size From The Table.
${EndMessage1}    Successfully Selected T-Shirt Size From The Table.
# TC3
${StartMessage2}   Selecting T-Shirt Size.
${EndMessage2}     Successfully Selected T-Shirt Size.
# TC4
${StartMessage3}   Searching Particular Product By Sending Input Text In SearchBar.
${EndMessage3}     Successfully Searched A Product.
# TC5
${StartMessage4}    Navigating To The Particular Website And Dismissing Pop-up.
${EndMessage4}    Successfully Compared The Values.