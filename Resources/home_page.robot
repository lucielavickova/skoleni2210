*** Settings ***
Library  String
*** Variables ***
${search_field}  //input[@id="search_query_top"]
${search_btn}  //form[@id="searchbox"]/button[@name="submit_search"]
${product_box}  //ul[contains(@class,"product_list")]/li
${sign_in_btn}  //nav//a[@class="login"]

*** Keywords ***
Get Url For Sign In
    [Documentation]  get href from A tag
    wait until page contains element  ${sign_in_btn}
    ${url_for_login}  get element attribute  ${sign_in_btn}  href
    [Return]  ${url_for_login}

Search Term
    [Documentation]  Input text into search field
    [Arguments]  ${search_text}
    wait until element is visible  ${search_field}
    input text  ${search_field}  ${search_text}
    wait until element is enabled  ${search_btn}
    click element  ${search_btn}
    wait until keyword succeeds  20s  2s  element should contain  //h1  SEARCH


Check Search Results
    [Documentation]  Check Search Results
    [Arguments]  ${check_text}
    ${check_text}  convert to uppercase  ${check_text}
    element should contain  //h1  ${check_text}

Get Product Count
    [Documentation]  Return count of product
    ${count_products}  get element count  ${product_box}
    [Return]  ${count_products}

Click On Product Box
    [Documentation]  Lorem ipsum
    [Arguments]  ${order}
    click element  ${product_box}\[${order}\]//a[@class="product-name"]

Get Name On Product Box
    [Documentation]  Lorem ipsum
    [Arguments]  ${order}
    ${name}  get text  ${product_box}\[${order}\]//a[@class="product-name"]
    [Return]  ${name}

Get Price On Product Box
    [Documentation]  Lorem ipsum
    [Arguments]  ${order}
    ${price}  get text  ${product_box}\[${order}\]//div[@class="right-block"]//span[@itemprop="price"]
    [Return]  ${price}
