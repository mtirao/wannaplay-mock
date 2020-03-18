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


profile_1 =  Profile "Camila" "Barber Clas" "cbarberclas@wannaplay.club" "goalkeeper" 30 "549153838570" "1977-01-12" "female" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "cbarberclas@wannaplay.club" 1
profile_2 =  Profile "Ariel" "Galliano" "agalliano@wannaplay.club" "midfield" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "agalliano@wannaplay.club" 2
profile_3 =  Profile "Juan" "Gargiulo" "jgargiulo@wannaplay.club" "goalkeeper" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "jgargiulo@wannaplay.club" 3
profile_4 =  Profile "Franco" "Nisi" "fnisi@wannaplay.club" "midfield" 30 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "fnisi@wannaplay.club" 4
profile_5 =  Profile "Leila" "Feiguin" "lfeiguin@wannaplay.club" "goalkeeper" 30 "549153838570" "1977-01-12" "female" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "lfeiguin@wanna play.club" 5
profile_6 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao@icloud.com" 6


friend_list = Friends "" [profile_1, profile_2, profile_3, profile_4, profile_5, profile_6] 6 ""

profile_7 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao1@icloud.com" 7
profile_8 =  Profile "Agustin" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao2@icloud.com" 8
profile_9 =  Profile "Juan" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao3@icloud.com" 9
profile_10 =  Profile "Federico" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao4@icloud.com" 10
profile_11 =  Profile "Fabio" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao5@icloud.com" 11
profile_12 =  Profile "Alejandro" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao6@icloud.com" 12

players_list = Friends "" [profile_7, profile_8, profile_9, profile_10, profile_11, profile_12] 6 ""

profile_13 =  Profile "Marcos" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao7@icloud.com" 13
profile_14 =  Profile "Agustin" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao8@icloud.com" 14
profile_15 =  Profile "Juan" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao9@icloud.com" 15
profile_16 =  Profile "Federico" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao10@icloud.com" 16
profile_17 =  Profile "Fabio" "Tirao" "marcos.tirao@icloud.com" "goalkeeper" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao11@icloud.com" 17
profile_18 =  Profile "Alejandro" "Tirao" "marcos.tirao@icloud.com" "midfield" 43 "549153838570" "1977-01-12" "male" "" "Vicente Lopez, Buenos Aires Argentina." "Jugador creativo en epoca de crisis, fanatico del futbol y las buenas costumbres" True score_1 5 5 5 5 5 5 "marcos.tirao12@icloud.com" 18

suggested_players_list = Friends "" [profile_13, profile_14, profile_15, profile_16, profile_17, profile_18] 6 ""

getFriendsR  :: Handler Value
getFriendsR = returnJson $ friend_list

getSuggestedR :: Handler Value
getSuggestedR = returnJson $ suggested_players_list

getPlayersR :: Handler Value
getPlayersR = returnJson $ players_list

postAddFriendsR  :: Int -> Handler Value
postAddFriendsR playerId = returnJson $ profile_1
