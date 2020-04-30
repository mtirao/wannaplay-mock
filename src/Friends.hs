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
import Network.HTTP.Types

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


profile_1 =  Profile "Camila" "Barber Clas" "cbarberclas@wannaplay.club" "goalkeeper" 30 "549153838570" "1977-01-12" "female" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 1 1
profile_2 =  Profile "Ariel" "Galliano" "agalliano@wannaplay.club" "midfield" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 2 2
profile_3 =  Profile "Juan" "Gargiulo" "jgargiulo@wannaplay.club" "goalkeeper" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 2 3
profile_4 =  Profile "Franco" "Nisi" "fnisi@wannaplay.club" "midfield" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 3 4
profile_5 =  Profile "Leila" "Feiguin" "lfeiguin@wannaplay.club" "goalkeeper" 30 "549153838570" "1977-01-12" "female" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 4 5
profile_6 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 5 6


friend_list = Friends "" [profile_1, profile_2, profile_3, profile_4, profile_5, profile_6] 6 ""

profile_7 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 7
profile_8 =  Profile "Agustin" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 8
profile_9 =  Profile "Juan" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 9
profile_10 =  Profile "Federico" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 10
profile_11 =  Profile "Fabio" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 11
profile_12 =  Profile "Alejandro" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 12

players_list = Friends "" [profile_7, profile_8, profile_9, profile_10, profile_11, profile_12] 6 ""

profile_13 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 13
profile_14 =  Profile "Agustin" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 14
profile_15 =  Profile "Juan" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 15
profile_16 =  Profile "Federico" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 16
profile_17 =  Profile "Fabio" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 17
profile_18 =  Profile "Alejandro" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 6 18

suggested_players_list = Friends "" [profile_13, profile_14, profile_15, profile_16, profile_17, profile_18] 6 ""

getFriendsR  :: Handler Value
getFriendsR = returnJson $ friend_list

getSuggestedR :: Handler Value
getSuggestedR = returnJson $ suggested_players_list

getPlayersR :: Handler Value
getPlayersR = returnJson $ players_list

postAddFriendsR  :: Int -> Handler Value
postAddFriendsR playerId = returnJson $ profile_1

deleteAddFriendsR  :: Int -> Handler Value
deleteAddFriendsR playerId = returnJson $ profile_1
