*** Settings ***
Documentation    Suite description

*** Variables ***
${mail_input}  //input[@id="email"]
${password_input}  //input[@id="passwd"]
${submit_login_btn}  //button[@id="SubmitLogin"]

*** Keywords ***
Check login page
    wait until page contains element  ${submit_login_btn}
    ${title}  get title
    should be equal as strings  ${title}  Login - My Store  msg=Check login page

Login As User
    [Documentation]  login to profile
    [Arguments]  ${user}  ${psw}
    input text  ${mail_input}  ${user}
    input text  ${password_input}  ${psw}
    click element  ${submit_login_btn}
