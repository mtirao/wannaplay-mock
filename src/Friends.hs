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
import Profile

data Friends = Friends
    { previous_friends :: Text
    , results_friends :: [Profile]
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

profile_1 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5
profile_2 =  Profile "Agustin" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5
profile_3 =  Profile "Juan" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5
profile_4 =  Profile "Federico" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5
profile_5 =  Profile "Fabio" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5
profile_6 =  Profile "Alejandro" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5


friend_list = Friends "" [profile_1, profile_2, profile_3, profile_4, profile_5, profile_6] 6 ""

getFriendsR  :: Handler Value
getFriendsR = returnJson $ friend_list

getSuggestedR :: Handler Value
getSuggestedR = returnJson $ friend_list

getPlayersR :: Handler Value
getPlayersR = returnJson $ friend_list
