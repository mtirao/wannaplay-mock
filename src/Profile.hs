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

data Score = Score 
    {value :: Double
    , text :: Text
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
        , "profile_image_url" .= picture
        , "location" .= location
        , "bio" .= bio
        , "share_location" .= shareLocation
        , "score" .= score
        , "games" .= games
        , "speed" .= speed
        , "strength" .= strength
        , "players" .= players
        , "control" .= control
        , "fair_play" .= fair_play
        ]

score_1 = Score 4.3 "advanced"

profile =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "" "" True score_1 5 5 5 5 5 5

getProfileR  :: Handler Value
getProfileR = returnJson $ profile

putProfileR  :: Handler Value
putProfileR = returnJson $ profile

patchQualifyR :: Int -> Handler Value
patchQualifyR id = returnJson $ profile