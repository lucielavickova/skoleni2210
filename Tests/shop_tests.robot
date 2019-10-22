*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource  ../Resources/common.robot
Resource  ../Resources/home_page.robot
Resource  ../Resources/product_detail_page.robot
Resource  ../Resources/login_page.robot
Resource  ../Resources/profile_page.robot

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

Check Product Detail
    [Documentation]  TC_02 – Check Product Detail
    [Tags]  TC_02
    Search Term  Dress
    ${product_count}  Get Product Count
    ${random_int}  Get Random Number  ${product_count}
    Click On Product Box  ${random_int}
    Basic Check Product Detail

Change User Profile
    [Documentation]  TC_03 Change user name in profile
    [Tags]  TC_03
    ${sign_url}  Get Url For Sign In
    go to  ${sign_url}
    Check login page
    Login As User  ${USER_MAIL}  ${USER_PSW}
    Open Personal Information
    Change User Surname  Kraken

