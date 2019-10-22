*** Variables ***
${personal_information_btn}  //a[@title="Information"]
${last_name_input}  //input[@id="lastname"]
${old_password_input}  //input[@id="old_passwd"]
${submint_identity}  //button[@name="submitIdentity"]
${user_info_text}  //div[@class="header_user_info"]/a/span
${back_to_information_btn}  //ul[@class="footer_links clearfix"]//a

*** Keywords ***
Open Personal Information
    [Documentation]  lorem ipsum
    wait until page contains element  ${personal_information_btn}
    click element  ${personal_information_btn}


Change User Surname
    [Documentation]  Change surname in personal information
    [Arguments]  ${surname}=Hák
    wait until page contains element  ${last_name_input}
    clear element text  ${last_name_input}
    #clear text  ${last_name_input}
    input text  ${last_name_input}  ${surname}
    input text  ${old_password_input}  ${USER_PSW}
    click element  ${submint_identity}
    wait until element contains  ${user_info_text}  ${surname}
    click element  ${back_to_information_btn}
    Open Personal Information
    wait until page contains element  ${last_name_input}
    ${actual_surname}  get value  ${last_name_input}
    should be equal as strings  ${surname}  ${actual_surname}  msg=Check surname after save