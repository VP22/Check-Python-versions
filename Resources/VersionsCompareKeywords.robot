*** Settings ***
Resource  ./VersionsCompareFunctions.robot
Resource  ../Data/VersionCompareData.robot

*** Keywords ***
I open the Google search page
    Open the Google search page

I run the search by the "python" key
    Run the search with the key on the Google search page  ${Google_search_key}

I click on the link with the "Download" text
    Find the required result  ${Google_required_result}
    Click on the link of the found result

I get the version in the text on the [Download] button
    Get the version in the text on the [Download] button

I get the version of the assigned to the button file name
    Get the version of the assigned to the button file name

I see the same version both in text of the button and file name
    Compare versions in text of the button and file name

I opened the Python Download page
    Open the Google search page
    Run the search with the key on the Google search page  ${Google_search_key}
    Find the required result  ${Google_required_result}
    Click on the link of the found result

I get the end of support of the 3.8 Python version
    Get the end of support of the 3.8 Python version

I see that the date is correct
    Compare the found date with the required date with year and month only