{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Login where

import Foundation
import Data.Text (Text)
import Data.Maybe
import Yesod.Core
import Data.Aeson


data User  = User
    { first_name :: Text
    , last_name  :: Text
    , display_name :: Text
    , username_u  :: Text
    , status :: Maybe Text
    , token_type  :: Text
    , token :: Text
    , position :: Text
    , picture :: Text
    , expired_at :: Text
    , refresh :: Text
    , chat_id :: Integer
    } 

instance ToJSON User where
    toJSON User {..} = object
        [ "first_name" .= first_name
        , "last_name" .= last_name
        , "display_name" .= display_name
        , "username" .= username_u
        , "status" .= status
        , "token_type" .= token_type
        , "token" .= token
        , "position" .= position
        , "picture" .= picture
        , "expired_at" .= expired_at
        , "refresh" .= refresh
        , "chat_id" .= chat_id
        ]

data Login = Login 
    { username :: Text
      , password :: Text
    }

data UserError = UserError
    {
        email :: [Text]
    }

instance FromJSON Login where
    parseJSON (Object v) = Login <$>
        v .:  "username" <*>
        v .:  "password"

instance ToJSON UserError where
    toJSON UserError {..} = object
        [
            "email" .= email
        ]
       

login_1 = User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 2
login_3 = User "Leila" "Feiguin" "Leila Feiguin" "lfeiguin@wannaplay.club" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 4
login_4 = User "Ariel" "Galliano" "Ariel Galliano" "agalliano@wannaplay.club" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 5
login_5 = User "Juan" "Gargiulo" "Ariel Galliano" "jgargiulo@wannaplay.club" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 6
login_6 = User "Franco" "Nisi" "Ariel Galliano" "fnisi@wannaplay.club" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 7
login_2 = User "Camila" "Barber Clas" "Barber Clas" "fnisi@wannaplay.club" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 3


users = [login_1, login_2, login_3, login_4, login_5, login_6]
filterUser :: Text -> [User] -> Handler Value
filterUser u (x:xs) = if (username_u x) == u then  returnJson $ x else filterUser u xs 
filterUser u [] =  permissionDenied "Invalid Message" -- $ UserError ["Invalid error"]


postLoginR  :: Handler Value
postLoginR = do 
    request <- requireJsonBody :: Handler Login
    filterUser (username request) users


postSignUpR  :: Handler Value
postSignUpR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 1

postChangePasswordR  :: Handler Value
postChangePasswordR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 1

postResetPasswordR  :: Handler Value
postResetPasswordR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 1

postSocialLoginR  :: Handler Value
postSocialLoginR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 1

postRefreshR  :: Handler Value
postRefreshR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890" "goalkeeper" "" "2030-07-16T19:20:30.45+01:00" "12345677890" 1
