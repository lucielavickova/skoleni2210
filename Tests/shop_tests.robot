*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  Collections

Resource  ../Resources/common.robot
Resource  ../Resources/home_page.robot
Resource  ../Resources/product_detail_page.robot
Resource  ../Resources/login_page.robot
Resource  ../Resources/profile_page.robot

Variables  ../Data/product_details.py

Test Setup  Open Home Page
Test Teardown  Close All Browsers

*** Variables ***
${URL} =  http://automationpractice.com/index.php
${BROWSER} =  chrome
${USER_MAIL} =  tomas.hak@tesena.com
${USER_PSW} =  HesloProSkoleni

*** Test Cases ***
Search For Product
    [Documentation]  TC_01 - short descr. TC
    [Tags]  TC_01  DEBUG
    Search Term  Dress
    Check Search Results  Dress

Check Random Product Detail
    [Documentation]  TC_02 – Check Product Detail
    [Tags]  TC_02
    Search Term  Dress
    ${product_count}  Get Product Count
    ${random_int}  Get Random Number  ${product_count}
    Click On Product Box  ${random_int}
    Basic Check Product Detail

Check Product Detail
    open product detail     2
    detailed check product detail  ${PRODUCT_DETAIL_2}

Change User Profile
    [Documentation]  TC_03 Change user name in profile
    [Tags]  TC_03
    ${sign_url}  Get Url For Sign In
    go to  ${sign_url}
    Check login page
    Login As User  ${USER_MAIL}  ${USER_PSW}
    Open Personal Information
    Change User Surname  Kraken


Purchase Order
    [Documentation]  TC_04  Add product to cart
    [Tags]  TC_04
    Search Term  Dress
    ${product_count}  Get Product Count
    should not be equal as integers  ${product_count}  0  msg=Check product count
    ${name_box}  Get Name On Product Box  1
    ${price_box}  Get Price On Product Box  1
    Click On Product Box  1
    Basic Check Product Detail
    ${name_detail}  Get Name On Detail
    ${price_detail}  Get Price On Detail
    should be equal as strings  ${name_box}  ${name_detail}
    should be equal as strings  ${price_box}  ${price_detail}
    Add To Cart
    Check Product Successfully Added To Cart
    ${name_cart}  ${price_cart}  Get Name And Price On Cart
    should be equal as strings  ${name_box}  ${name_cart}
    should be equal as strings  ${price_box}  ${price_cart}
