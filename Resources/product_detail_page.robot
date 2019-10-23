*** Settings ***
Documentation    Suite description

*** Variables ***
${big_pic}  //img[@id="bigpic"]
${title}    //h1
${model_text}  //*[@id="product_reference"]//span
${condition_text}   //*[@id="product_condition"]//span
${short_desc_text}  //*[@id="short_description_content"]
${price_text}  //span[@id="our_price_display"]
${size_select}      //*[@id="attributes"]//select
${add_to_cart_btn}  //p[@id="add_to_cart"]/button
${price_cart_text}  //span[@id="layer_cart_product_price"]
${name_cart_text}  //span[@id="layer_cart_product_title"]

*** Keywords ***
Basic Check Product Detail
    [Documentation]  Only basic check
    wait until keyword succeeds  20s  2s  element should be visible  ${add_to_cart_btn}
    element should be visible  ${price_text}
    element should be visible  ${big_pic}
    element should be visible  ${title}

Detailed Check Product Detail
    [Arguments]  ${exp_product_details}
    element text should be      ${title}                ${exp_product_details}[name]
    element text should be      ${model_text}           ${exp_product_details}[model]
    element text should be      ${condition_text}       ${exp_product_details}[condition]
    element text should be      ${short_desc_text}      ${exp_product_details}[short_desc]
    element text should be      ${price_text}           ${exp_product_details}[price]

    @{sizes}    get from dictionary     ${exp_product_details}      sizes
    # verify number of size options
    ${exp_size_count}   get length  ${sizes}
    ${size_count}       get element count       ${size_select}//option
    run keyword and continue on failure
    ...     should be equal as numbers     ${exp_size_count}       ${size_count}

    # verify size options text
    :FOR  ${size}   IN      @{sizes}
    \   ${i}    get index from list     ${sizes}    ${size}
    \   run keyword and continue on failure
    ...     element text should be      ${size_select}//option[${i+1}]      ${size}

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
