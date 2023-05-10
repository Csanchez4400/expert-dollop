*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections




*** Variables ***
${url}=    http://thetestingworldapi.com 



*** Test Cases ***
TC_01_GET_STUDENT
    Create Session    session_Cristhian    ${url}
    ${reponse}    GET On Session    session_Cristhian    /api/studentsDetails/7478328
    Log    ${reponse}
    Log    ${reponse.status_code}
    Log    ${reponse.content}
    ${reponse_json}    To Json    ${reponse.content}
    @{first_name_list}    Get Value From Json    ${reponse_json}    data.first_name     # @{first_name_list} = TRES TRES IMPORTANT de stocker les réponses de json dans una variable LISTE ! 
    Log    @{first_name_list}
    ${valeur_first_name}    Get From List    ${first_name_list}    0         # Il y a juste un valeur. 0 prmière valeur d'une liste (il faut aussi changer @ poue $)
    Log    ${valeur_first_name}
    Should Be Equal As Strings    ${valeur_first_name}    Younes
    Should Be Equal As Integers    ${reponse.status_code}    200  

*** Keywords ***


