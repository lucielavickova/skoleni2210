*** Settings ***
Documentation    Suite description

*** Variables ***
${price_text}  //span[@id="our_price_display"]
${add_to_cart_btn}  //p[@id="add_to_cart"]/button
${big_pic}  //img[@id="bigpic"]
${title}    //h1
${price_cart_text}  //span[@id="layer_cart_product_price"]
${name_cart_text}  //span[@id="layer_cart_product_title"]

*** Keywords ***
Basic Check Product Detail
    [Documentation]  Only basic check
    wait until keyword succeeds  20s  2s  page should contain element  ${add_to_cart_btn}
    page should contain element  ${price_text}
    page should contain element  ${big_pic}
    page should contain element  ${title}

Get Name On Detail
    [Documentation]  get name
    ${product_name}  get text  ${title}
    [Return]  ${product_name}

Get Price On Detail
    [Documentation]  get price on detail
    ${product_price}  get text  ${price_text}
    [Return]  ${product_price}

Add To Cart
    [Documentation]  add product to cart
    click element  ${add_to_cart_btn}

Check Product Successfully Added To Cart
    wait until element is visible  //div[@class="clearfix"]  timeout=15s
    page should contain  Product successfully added to your shopping cart

Get Name And Price On Cart
    ${product_name_cart}  get text  ${name_cart_text}
    ${product_price_cart}  get text  ${price_cart_text}
    [Return]  ${product_name_cart}  ${product_price_cart}
