*** Settings ***


*** Keywords ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser    url=https://app.deriv.com   browser=chrome
    set window size     1920    1080
#    wait until page does not contain element    dt_core_header_acc-info-pre
    wait until page contains element    ${login_btn}     60
    Click Element   ${login_btn}
    wait until page contains element    ${email_field}  15
    input text      ${email_field}  ${email}
    input text      ${pw_field}   ${pw}
    Click Element   ${login_oauth_btn}

Setting Page
    wait until page does not contain element    ${header_preloader}    60
    click element   //*[@class="account-settings-toggle"]
    wait until page contains element  //*[@class="dc-vertical-tab__tab dc-vertical-tab__tab--floating"]   60
    click element   dc_api-token_link

Select Scope
    wait until page does not contain element    //*[@class="initial-loader account__initial-loader"]    60
# select read
    click element    ${read_parent}
    Checkbox should be selected     ${read}
# select trade
    click element    ${trade_parent}
    Checkbox should be selected     ${trade}
# select payments
    click element    ${payments_parent}
    Checkbox should be selected     ${payments}
# select admin
    click element    ${admin_parent}
    Checkbox should be selected     ${admin}
# select trading_information
    click element    ${trading_information_parent}
    Checkbox should be selected     ${trading_information}

# unselect read
    click element    ${read_parent}
    Checkbox should not be selected     ${read}
# unselect trade
    click element    ${trade_parent}
    Checkbox should not be selected     ${trade}
# unselect payments
    click element    ${payments_parent}
    Checkbox should not be selected     ${payments}
# unselect admin
    click element    ${admin_parent}
    Checkbox should not be selected     ${admin}
# unselect trading_information
    click element    ${trading_information_parent}
    Checkbox should not be selected     ${trading_information}

Input Name
    click element   //*[@class="dc-input da-api-token__input"]
#   Input 1 character
    Input Text  //*[@name="token_name"]      H     True
    Wait until page contains element       //*[text()="Length of token name must be between 2 and 32 characters." and contains(@class, "dc-field dc-field--error")]   15
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
#   Input 33 character
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      1234567890qwertyuiopasdfghjklzxcv     True
    Wait until page contains element       //*[text()="Maximum 32 characters." and contains(@class, "dc-field dc-field--error")]   15
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
#   Input symbol
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      !@     True
    Wait until page contains element       //*[text()="Only letters, numbers, and underscores are allowed." and contains(@class, "dc-field dc-field--error")]   15
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
#   Blank input
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Wait until page contains element       //*[text()="Please enter a token name." and contains(@class, "dc-field dc-field--error")]   15
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
#   Input alphanumeric (between 2 and 32 characters)
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      Hi this is     True
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
#   Input alphanumeric and underscore (between 2 and 32 characters)
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      _Hi_this_is     True
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]


Token Creation

    # select 1 scope and invalid name
    click element    ${read_parent}
    Checkbox should be selected     ${read}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      1234567890qwertyuiopasdfghjklzxcv     True
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

    # select 1 scope and valid name
    Checkbox should be selected     ${read}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      Hi this is     True
    Element should be enabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

    # select 3 scopes and invalid name
    Checkbox should be selected     ${read}
    click element    ${trade_parent}
    Checkbox should be selected     ${trade}
    click element    ${payments_parent}
    Checkbox should be selected     ${payments}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      H     True
    Wait until page contains element       //*[text()="Length of token name must be between 2 and 32 characters." and contains(@class, "dc-field dc-field--error")]   15
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

    # select 3 scopes and valid name
    Checkbox should be selected     ${read}
    Checkbox should be selected     ${trade}
    Checkbox should be selected     ${payments}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      _Hi_this_is     True
    Element should be enabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

    # select all scopes and invalid name
    Checkbox should be selected     ${read}
    Checkbox should be selected     ${trade}
    Checkbox should be selected     ${payments}
    click element    ${admin_parent}
    Checkbox should be selected     ${admin}
    click element    ${trading_information_parent}
    Checkbox should be selected     ${trading_information}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      !@     True
    Wait until page contains element       //*[text()="Only letters, numbers, and underscores are allowed." and contains(@class, "dc-field dc-field--error")]   15
    Element should be disabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

    # select all scopes and valid name
    Checkbox should be selected     ${read}
    Checkbox should be selected     ${trade}
    Checkbox should be selected     ${payments}
    Checkbox should be selected     ${admin}
    Checkbox should be selected     ${trading_information}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      Hi this is     True
    Element should be enabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

Create
    click element   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]

Create Another
    reload page
    wait until page does not contain element    //*[@class="initial-loader account__initial-loader"]    60
    click element    ${read_parent}
    Checkbox should be selected     ${read}
    press keys  //*[@name="token_name"]     CTRL+ALL    DELETE
    Input Text  //*[@name="token_name"]      Test2     True
    Element should be enabled      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
    press keys      //*[@name="token_name"]     ENTER

Copy
    //*[text()="NCZx9XvAL3URGCI" and contains (@class, "dc-text")]//parent::div
    //*[text()="NCZx9XvAL3URGCI" and contains @class, "dc-icon dc-clipboard da-api-token__clipboard"]




