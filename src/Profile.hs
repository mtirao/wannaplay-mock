{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Profile where

import Foundation
import Data.Text (Text)
import Yesod.Core

data Score = Score {
    value :: Double
    text :: Text
}

data Profile = Profile
    { first_name :: Text
    , last_name  :: Text
    , email :: Text
    , position  :: Text
    , age :: Int
    , mobile  :: Text
    , birthdate :: Text
    , gender ::  Text
    , picture :: Text
    , location :: Text
    , bio :: Text
    , shareLocation :: Bool
    , score :: Score
    , games :: Int
    , speed :: Double
    , strength :: Double
    , players :: Int
    , control :: Double
    , fair_play :: Double
    }

instance ToJSON Score where
    toJSON Score {..} = object
        [ "value" .= value
        , "text" .= text
        ]

instance ToJSON Profile where
    toJSON Profile {..} = object
        [ "first_name" .= first_name
        , "last_name" .= last_name
        , "email" .= email
        , "position" .= position
        , "age" .= age
        , "mobile" .= mobile
        , "birthdate" .= birthdate
        , "gender" .= gender
        , "picture" .= picture
        , "location" .= location
        , "bio" .= bio
        , "shareLocation" .= shareLocation
        , "score" .= score
        , "games" .= games
        , "speed" .= speed
        , "strength" .= strength
        , "players" .= 
        , "control" .= control
        , "fair_play" .= fair_play
    ]

profile =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "" ""

getProfileR  :: Handler Value
getProfileR = returnJson $ User "Marcos" "Tirao" "Marcos Tirao" "marcos.tirao@icloud.com" Nothing "JWT" "12345677890"

