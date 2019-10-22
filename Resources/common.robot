
*** Keywords ***
Open Home Page
    open browser  ${URL}  ${BROWSER}
    maximize browser window

Get Random Number
    [Documentation]  return random number
    [Arguments]  ${to}  ${from}=1
    ${random_int} =  Evaluate	random.randint(${from}, ${to})	modules=random
    [Return]  ${random_int}