
*** Keywords ***
Open Home Page
    open browser  ${URL}  ${BROWSER}
    #open browser  ${URL}  remote_url=https://tomashak4:XXXXXXXXXXXXX@hub-cloud.browserstack.com/wd/hub
    #...                   desired_capabilities=browser:edge,browser_version:18.0,os:Windows,os_version:10
    maximize browser window

Get Random Number
    [Documentation]  return random number
    [Arguments]  ${to}  ${from}=1
    ${random_int} =  Evaluate	random.randint(${from}, ${to})	modules=random
    [Return]  ${random_int}

Open Product Detail
    [Arguments]  ${product_id}
    go to  ${URL}?id_product=${product_id}&controller=product