{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Login where

import Foundation
import Data.Text (Text)
import Yesod.Core

data User = User
    { first_name :: Text
    , last_name  :: Text
    , display_name :: Text
    , username  :: Text
    , status :: Maybe Text
    , token_type  :: Text
    , token :: Text
    }

instance ToJSON User where
    toJSON User {..} = object
        [ "first_name" .= first_name
        , "last_name" .= last_name
        , "display_name" .= display_name
        , "username" .= username
        , "status" .= status
        , "token_type" .= token_type
        , "token" .= token
        ]


postLoginR  :: Handler Value
postLoginR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"

postSignUpR  :: Handler Value
postSignUpR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"

postChangePasswordR  :: Handler Value
postChangePasswordR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"

postResetPasswordR  :: Handler Value
postResetPasswordR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"

postSocialLoginR  :: Handler Value
postSocialLoginR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"

postRefreshR  :: Handler Value
postRefreshR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"
