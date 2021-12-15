*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}     name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}      //*[text()="Log in"]
${header_preloader}     dt_core_header_acc-info-preloader
${read_parent}     //*[@name="read" and contains(@class, "dc-checkbox__input")]//parent::label
${read}     //*[@name="read" and contains(@class, "dc-checkbox__input")]
${trade_parent}     //*[@name="trade" and contains(@class, "dc-checkbox__input")]//parent::label
${trade}     //*[@name="trade" and contains(@class, "dc-checkbox__input")]
${payments_parent}     //*[@name="payments" and contains(@class, "dc-checkbox__input")]//parent::label
${payments}     //*[@name="payments" and contains(@class, "dc-checkbox__input")]
${admin_parent}     //*[@name="admin" and contains(@class, "dc-checkbox__input")]//parent::label
${admin}     //*[@name="admin" and contains(@class, "dc-checkbox__input")]
${trading_information_parent}     //*[@name="trading_information" and contains(@class, "dc-checkbox__input")]//parent::label
${trading_information}     //*[@name="trading_information" and contains(@class, "dc-checkbox__input")]


*** Test Cases ***
Open Browser
    Login   ${my_email}  ${my_pw}
    Setting Page
    Select Scope
    Input Name
    Token Creation
Create Token
    Create
Create Token (Enter)
    Create Another
