*** Variables ***

# *** Android 11 variables ***
${ANDROID10_CONTINUE_BUTTON}        id=com.android.permissioncontroller:id/continue_button
${ANDROID10_OK_BUTTON}              //android.widget.Button[@text='OK']

# *** Login Page ****
${LOGIN_EMAIL_FIELD}                id=${CHAT21_APPLICATION_ID}:id/email
${LOGIN_PASSWORD_FIELD}             id=${CHAT21_APPLICATION_ID}:id/password
${LOGIN_SIGNIN_BUTTON}              id=${CHAT21_APPLICATION_ID}:id/login

# *** Main Page ***

${MAIN_HOME_TAB}                    //android.widget.TextView[@text="HOME"]
${MAIN_PROFILE_TAB}                 //android.widget.TextView[@text="PROFILE"]
${MAIN_CHAT_TAB}                    //android.widget.TextView[@text="CHAT"]

# *** Profile Page ***
${PROFILE_LOGOUT_BUTTON}            id=${CHAT21_APPLICATION_ID}:id/logout

# *** Chat Tab ***
${CHAT_NEW_CONVERSATION_BUTTON}        id=${CHAT21_APPLICATION_ID}:id/button_new_conversation
${NEW-CONVERSATION-CONTACTS-HEADER}    //android.view.ViewGroup[contains(@resource-id,'toolbar')]//android.widget.TextView[@text="Contacts"]
${NEW_CONVERSATION_CONTACTS_HEADER_SEARCH_BUTTON}    id=${CHAT21_APPLICATION_ID}:id/action_search
${NEW_CONVERSATION_CONTACTS_HEADER_SEARCH_FIELD}     id=${CHAT21_APPLICATION_ID}:id/search_src_text

# *** Conversation Window ***
${CONVERSATION_INPUT_FIELD}            id=${CHAT21_APPLICATION_ID}:id/main_activity_chat_bottom_message_edittext
${CONVERSATION_SEND_MESSAGE_BUTTON}    id=${CHAT21_APPLICATION_ID}:id/main_activity_send