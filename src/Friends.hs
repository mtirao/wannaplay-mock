{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Friends where

import Foundation
import Data.Text (Text)
import Yesod.Core
import Games

data Friends = Friends
    { previous_friends :: Text
    , results_friends :: [Player]
    , count_friends  :: Int
    , next_friends :: Text
    }

instance ToJSON Friends where
    toJSON Friends {..} = object
        [ "previous" .= previous_friends
        , "results" .= results_friends
        ,  "count" .= count_friends
        ,  "next" .= next_friends
        ]



getFriendsR  :: Handler Value
getFriendsR = returnJson $ Friends "" [player_1, player_2, player_3, player_4, player_5, player_6, player_7, player_8, player_9] 10 ""