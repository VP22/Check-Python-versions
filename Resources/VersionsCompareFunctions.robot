*** Settings ***
Library  SeleniumLibrary  timeout=20s
Library  String
Library  Collections
Resource  ../Data/VersionCompareData.robot

*** Keywords ***
Open the Google search page
    Go To  ${Google_page}
    Wait Until Page Contains Element  ${Google_search_input_element}

Run the search with the key on the Google search page
    [Arguments]  ${search_key}
    Input Text  ${Google_search_input_element}  ${search_key}
    Set Focus To Element  ${Google_search_run_element}
    Click Element  ${Google_search_run_element}

Find the required result
    [Arguments]  ${result}
    Page Should Contain  Download
    ${links} =  Get WebElements  ${Google_result_from_domain}
    ${found_result} =  Get From List  ${links}  0
    Set Test Variable  ${found_result}

Click on the link of the found result
    Click Element  ${found_result}

Get the version in the text on the [Download] button
    Wait Until Page Contains Element  ${Python_Download_button_element}
    ${button_text} =  Get Text  ${Python_Download_button_element}
    ${version_in_button} =  Remove String  ${button_text}  Download  Python
    ${version_in_button} =  Strip String  ${version_in_button}
    Set Test Variable  ${version_in_button}

Get the version of the assigned to the button file name
    ${assigned_file} =  Get Element Attribute  ${Python_Download_button_element}  href
    ${version_in_link} =  Fetch From Left  ${assigned_file}  /python-
    ${version_in_link} =  Fetch From Right  ${version_in_link}  python/
    Set Test Variable  ${version_in_link}

Compare versions in text of the button and file name
    Should Be Equal As Strings  ${version_in_button}  ${version_in_link}

Get the end of support of the 3.8 Python version
    Wait Until Page Contains Element  ${Python_Version_element}
    ${elements} =  Get WebElements  ${Python_Version_element}
    FOR  ${cell}  IN  @{elements}
        ${version} =  Get Text  ${cell}
        ${index} =  Get Index From List  ${elements}  ${cell}
        Run Keyword If  "${version}" == "${Python_required_version}"  Exit For Loop
    END
    ${elements} =  Get WebElements  ${Python_end_of_support_element}
    ${element} =  Get From List  ${elements}  ${index}
    ${found_date} =  Get Text  ${element}
    Set Test Variable  ${found_date}

Compare the found date with the required date with year and month only
    Should Be Equal As Strings  ${found_date}  ${Python_end_of_support_required_date}