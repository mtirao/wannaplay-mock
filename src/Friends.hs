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


player_detail_player_1 = PlayerDetail 1 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Marcos Player" "white" "Marcos" "marcos.tirao@icloud.com"
player_detail_player_2 = PlayerDetail 2 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Agustin Player" "black" "Agustin" "agustin.tirao@icloud.com"
player_detail_player_3 = PlayerDetail 3 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Juan Player" "white" "Juan" "juan.perez@icloud.com"
player_detail_player_4 = PlayerDetail 4 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Federico Player" "black" "Federico" "fede.gomez@icloud.com"
player_detail_player_5 = PlayerDetail 6 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Fernando Player" "black" "Fernando" "fer.penna@icloud.com"
player_detail_player_6 = PlayerDetail 8 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Fabio Player" "white" "Fabio" "fabio.perez@icloud.com"
player_detail_player_7 = PlayerDetail 9 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Alejandro Player" "black" "Alejandro" "ale.fernandez@icloud.com"

player_detail_suggest_1 = PlayerDetail 1 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Marcos Suggest" "white" "Marcos" "marcos.tirao@icloud.com"
player_detail_suggest_2 = PlayerDetail 2 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Agustin Suggest" "black" "Agustin" "agustin.tirao@icloud.com"
player_detail_suggest_3 = PlayerDetail 3 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Juan Suggest" "white" "Juan" "juan.perez@icloud.com"
player_detail_suggest_4 = PlayerDetail 4 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Federico Suggest" "black" "Federico" "fede.gomez@icloud.com"
player_detail_suggest_5 = PlayerDetail 6 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Fernando Suggest" "black" "Fernando" "fer.penna@icloud.com"
player_detail_suggest_6 = PlayerDetail 8 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Fabio Suggest" "white" "Fabio" "fabio.perez@icloud.com"
player_detail_suggest_7 = PlayerDetail 9 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Alejandro Suggest" "black" "Alejandro" "ale.fernandez@icloud.com"


player_player_1 =  Player player_detail_player_1 status_confirmed
player_player_2 =  Player player_detail_player_2 status_confirmed
player_player_3 =  Player player_detail_player_3 status_confirmed
player_player_4 =  Player player_detail_player_4 status_declined
player_player_5 =  Player player_detail_player_5 status_declined
player_player_6 =  Player player_detail_player_6 status_declined
player_player_7 =  Player player_detail_player_7 status_confirmed

player_suggest_1 =  Player player_detail_suggest_1 status_confirmed
player_suggest_2 =  Player player_detail_suggest_2 status_confirmed
player_suggest_3 =  Player player_detail_suggest_3 status_confirmed
player_suggest_4 =  Player player_detail_suggest_4 status_declined
player_suggest_5 =  Player player_detail_suggest_5 status_declined
player_suggest_6 =  Player player_detail_suggest_6 status_declined
player_suggest_7 =  Player player_detail_suggest_7 status_confirmed




getFriendsR  :: Handler Value
getFriendsR = returnJson $ Friends "" [player_1, player_2, player_3, player_4, player_5, player_6, player_7, player_8, player_9] 9 ""

getSuggestedR :: Handler Value
getSuggestedR = returnJson $ Friends "" [player_suggest_1, player_suggest_2, player_suggest_3, player_suggest_4, player_suggest_5, player_suggest_6, player_suggest_7] 7 ""

getPlayersR :: Handler Value
getPlayersR = returnJson $ Friends "" [player_player_1, player_player_2, player_player_3, player_player_4, player_player_5, player_player_6, player_player_7] 7 ""
