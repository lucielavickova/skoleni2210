*** Settings ***
Documentation    Suite description

*** Variables ***
${price_text}  //span[@id="our_price_display"]
${add_to_cart_btn}  //p[@id="add_to_cart"]/button
${big_pic}  //img[@id="bigpic"]
${title}    //h1

*** Keywords ***
Basic Check Product Detail
    [Documentation]  Only basic check
    wait until keyword succeeds  20s  2s  page should contain element  ${add_to_cart_btn}
    page should contain element  ${price_text}
    page should contain element  ${big_pic}
    page should contain element  ${title}
