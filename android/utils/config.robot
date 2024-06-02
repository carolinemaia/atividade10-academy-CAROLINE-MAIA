*** Settings ***

Resource    ../../base.robot

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_APP_VERSION}        11
${ANDROID_APP_PACKAGE}        br.com.pztec.estoque
${ANDROID_APP_ACTIVITY}       .Inicio
${ANDROID_APP_PERMISSIONS}    true
${ANDROID_APP_NORESET}        true



*** Keywords ***
Open App
    Open Application    http://127.0.0.1:4723    automationName=${ANDROID_AUTOMATION_NAME}    platformName=${ANDROID_PLATFORM_NAME}    
    ...    platformVersion=${ANDROID_APP_VERSION}    appActivity=${ANDROID_APP_ACTIVITY}    appPackage=${ANDROID_APP_PACKAGE}    autoGrantPermissions=${ANDROID_APP_PERMISSIONS}    noReset=${ANDROID_APP_NORESET} 

Teardown
    Run Keyword    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications
