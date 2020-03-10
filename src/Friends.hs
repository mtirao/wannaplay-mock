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


profile_1 =  Profile "Camila" "Barber Clas" "marcos.tirao@icloud.com" "goalkeeper" 30 "549153838570" "1977-01-12" "female" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "cbarberclas@wannaplay.club"
profile_2 =  Profile "Ariel" "Galliano" "marcos.tirao@icloud.com" "midfield" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "agalliano@wannaplay.club"
profile_3 =  Profile "Juan" "Gargiulo" "marcos.tirao@icloud.com" "goalkeeper" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "jgargiulo@wannaplay.club"
profile_4 =  Profile "Franco" "Nisi" "marcos.tirao@icloud.com" "midfield" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "fnisi@wannaplay.club"
profile_5 =  Profile "Leila" "Feiguin" "marcos.tirao@icloud.com" "goalkeeper" 30 "549153838570" "1977-01-12" "female" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "lfeiguin@wannaplay.club"
profile_6 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"


friend_list = Friends "" [profile_1, profile_2, profile_3, profile_4, profile_5, profile_6] 6 ""

profile_7 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"
profile_8 =  Profile "Agustin" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"
profile_9 =  Profile "Juan" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"
profile_10 =  Profile "Federico" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"
profile_11 =  Profile "Fabio" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"
profile_12 =  Profile "Alejandro" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com"

players_list = Friends "" [profile_7, profile_8, profile_9, profile_10, profile_11, profile_12] 6 ""

getFriendsR  :: Handler Value
getFriendsR = returnJson $ friend_list

getSuggestedR :: Handler Value
getSuggestedR = returnJson $ players_list

getPlayersR :: Handler Value
getPlayersR = returnJson $ players_list
