# import requests module
import requests
import json

from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from robot.libraries.BuiltIn import BuiltIn


def WaitForElementAndClickElement(TradeButton,PopUP,Done):
    
    selib = BuiltIn().get_library_instance("SeleniumLibrary")
    driver = selib.driver
    TradeNow = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, TradeButton)))
    TradeNow.click()
    SkipAll = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, PopUP)))
    SkipAll.click()
    Done1 = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, Done)))
    Done1.click()
    

def WaitForElementScrollToViewAndClickonElement(OrderBook):
        
    selib = BuiltIn().get_library_instance("SeleniumLibrary")
    driver = selib.driver
    Sell = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, OrderBook)))
    Sell.location_once_scrolled_into_view
    Sell.click()
   

def WaitForElementScrollToViewAndGetText(Limit_Price):
        
    selib = BuiltIn().get_library_instance("SeleniumLibrary")
    driver = selib.driver
    Limitprize = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, Limit_Price)))
    Limitprize.location_once_scrolled_into_view
    Limitprize.click()
    c= Limitprize.get_attribute("value")
    return c

def Request(url,GetValues):

    response = requests.get(url)
    Bidsdata = json.loads(response.content)
    #Bids=Bidsdata['data']['bids'][0][0]

    for BidsResponse in range(0,10):
        Response=Bidsdata['data']['bids'][BidsResponse][0]
        if Response == GetValues:True
        break    
    return Response
    

  