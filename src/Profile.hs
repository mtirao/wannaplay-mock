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

data Message = Message 
    {   message :: Text
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

data Notification = Notification
    { wannaplay :: Bool
    , news  :: Bool
    , activity :: Bool
    , chat  :: Bool
    }

instance ToJSON Score where
    toJSON Score {..} = object
        [ "value" .= value
        , "text" .= text
        ]

instance ToJSON Message where
    toJSON Message {..} = object
        [   "message" .= message
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
  
instance ToJSON Notification where
    toJSON Notification {..} = object
        [ "wannaplay" .= wannaplay
        , "news" .= news
        , "activity" .= activity
        , "chat" .= chat
        ]

score_1 = Score 4.3 "advanced"

profile =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5

notification = Notification True True True True

getProfileR  :: Handler Value
getProfileR = returnJson $ profile

putProfileR  :: Handler Value
putProfileR = returnJson $ profile

patchQualifyR :: Int -> Handler Value
patchQualifyR id = returnJson $ profile

patchNotificationR :: Handler Value
patchNotificationR = returnJson $ notification

getNotificationR :: Handler Value
getNotificationR = returnJson $ notification

postHelpR :: Handler Value
postHelpR = returnJson $  Message "Ok"
