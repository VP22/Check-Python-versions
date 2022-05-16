*** Settings ***
Documentation  The available version of the Python on the Download page are checked
Resource  ../Resources/VersionsCompareKeywords.robot
Resource  ../Resources/Common.robot
Test Setup  Common.I open the browser
Test Teardown  Common.End Web Test

*** Test Cases ***
As a user, I find the Python download page in Google search and compare the version on the [Download] and in the download link
    [Documentation]  Check the text on the [Download] button and the file in the assigned to the button link
    Given I open the Google search page
    And I run the search by the "python" key
    And I click on the link with the "Download" text
    When I get the version in the text on the [Download] button
    And I get the version of the assigned to the button file name
    Then I see the same version both in text of the button and file name

As a user, I check the end of support of the 3.8 Python version
    [Documentation]  I used already created keywords to open the required page
    Given I opened the Python Download page
    When I get the end of support of the 3.8 Python version
    Then I see that the date is correct