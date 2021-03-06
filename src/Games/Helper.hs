{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Games.Helper where

import Games.Json
import Games.Types
import Fields.Types
import Fields.Helper
import Data.Text (Text)


age = Age 18 22
genders_male = "male"
genders_female = "female"
genders_mix = "mix"

status_unconfirmed = Status "unconfirmed"
status_confirmed = Status "confirmed"
status_declined = Status "declined"
status_postulable = Status "postulable"
status_postulated = Status "postulated"
status_inviting = Status "inviting"
status_canceled = Status "cancelled"
status_not_going = Status "notgoing"
status_invited = Status "invited"
status_finished = Status "finished"
status_invite = Status "invite"

player_detail_1 = PlayerDetail 1 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False False "Tirao" "white" "Marcos" "marcos.tirao@icloud.com"
player_detail_2 = PlayerDetail 2 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False True "Barber Clas" "black" "Camila" "cbarberclas@wannaplay.club"
player_detail_3 = PlayerDetail 3 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False True "Gargiulo" "white" "Juan" "jgargiulo@wannaplay.club"
player_detail_4 = PlayerDetail 4 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False True "Galliano" "black" "Ariel" "agalliano@wannaplay.club"
player_detail_5 = PlayerDetail 5 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True True "Nisi" "white" "Franco" "fnisi@wannaplay.club"
player_detail_6 = PlayerDetail 6 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True True "Leila" "black" "Feiguin" "lfeiguin@wannaplay.club"
player_detail_7 = PlayerDetail 7 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True True "Tirao" "black" "Agustin" "agustin.tirao@icloud.com"
player_detail_8 = PlayerDetail 8 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True True "Perez" "white" "Fabio" "fabio.perez@icloud.com"
player_detail_9 = PlayerDetail 9 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False True "Fernandez" "black" "Alejandro" "ale.fernandez@icloud.com"


player_1 =  Player player_detail_1 status_confirmed

player_confirmed_1 =  Player player_detail_1 status_confirmed

player_2 =  Player player_detail_2 status_invited
player_3 =  Player player_detail_3 status_postulated
player_4 =  Player player_detail_4 status_declined
player_5 =  Player player_detail_5 status_confirmed
player_6 =  Player player_detail_6 status_declined
player_7 =  Player player_detail_7 status_declined
player_8 =  Player player_detail_8 status_confirmed
player_9 =  Player player_detail_9 status_confirmed
player_10 =  Player player_detail_1 status_postulated

gameDetail_1 = Detail 1 age club_1 "2030-08-22 12:00:00 -0300" field_1 10 genders_male [player_1, player_2, player_3, player_4] "marcos.tirao@icloud.com" "game_1" 1000
gameDetail_2 = Detail 2 age club_2 "2030-08-23 12:00:00 -0300" field_1 10 genders_male [player_1, player_2, player_3, player_7] "agustin.tirao@icloud.com" "game_2" 3000
gameDetail_3 = Detail 3 age club_3 "2030-08-24 12:00:00 -0300" field_1 10 genders_male [player_1, player_8, player_9] "marcos.tirao@icloud.com" "game_3" 4000
gameDetail_4 = Detail 4 age club_4 "2030-08-25 12:00:00 -0300" field_1 10 genders_male [player_9, player_5, player_4] "ale.fernandez@icloud.com" "game_4" 5000
gameDetail_5 = Detail 5 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_1, player_2] "marcos.tirao@icloud.com" "game_5" 6000
gameDetail_6 = Detail 6 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_10, player_2, player_3, player_4] "marcos.tirao@icloud.com" "game_6" 7000
gameDetail_7 = Detail 6 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_confirmed_1] "ale.fernandez@icloud.com" "game_7" 8000
gameDetail_postulable_1 = Detail 7 age club_1 "2030-08-22 12:00:00 -0300" field_1 10 genders_male [player_5, player_2, player_3, player_4] "marcos.tirao@icloud.com" "game_8" 9000
gameDetail_postulable_2 = Detail 8 age club_2 "2030-08-23 12:00:00 -0300" field_1 10 genders_male [player_2, player_3, player_7] "marcos.tirao@icloud.com" "game_9" 10000
gameDetail_postulable_3 = Detail 9 age club_3 "2030-08-24 12:00:00 -0300" field_1 10 genders_male [player_7, player_8, player_9] "agustin.tirao@icloud.com" "game_10" 11000
gameDetail_postulable_4 = Detail 10 age club_4 "2030-08-25 12:00:00 -0300" field_1 10 genders_male [player_9, player_5, player_4] "marcos.tirao@icloud.com" "game_11" 12000
gameDetail_postulable_5 = Detail 11 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_3, player_2] "ale.fernandez@icloud.com" "game_12" 13000
gameDetail_postulable_6 = Detail 12 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_10, player_2, player_3, player_4] "marcos.tirao@icloud.com" "game_13" 14000
gameDetail_finished_1 = Detail 13 age club_1 "2019-07-22 12:00:00 -0300" field_1 10 genders_male [player_1, player_2, player_3, player_4] "marcos.tirao@icloud.com" "game_1" 15000
gameDetail_finished_2 = Detail 14 age club_2 "2019-07-23 12:00:00 -0300" field_1 10 genders_male [player_2, player_3, player_7] "marcos.tirao@icloud.com" "game_14" 16000
gameDetail_finished_3 = Detail 15 age club_3 "2019-07-24 12:00:00 -0300" field_1 10 genders_male [player_1, player_8, player_9] "ale.fernandez@icloud.com" "game_15" 17000
gameDetail_finished_4 = Detail 16 age club_4 "2019-07-25 12:00:00 -0300" field_1 10 genders_male [player_9, player_5, player_4] "agustin.tirao@icloud.com" "game_16" 18000
gameDetail_finished_5 = Detail 17 age club_1 "2019-07-26 12:00:00 -0300" field_1 10 genders_male [player_1, player_2] "marcos.tirao@icloud.com" "game_16" 19000

gameDetail_confirm_3 = Detail 13 age club_3 "2030-08-24 12:00:00 -0300" field_1 10 genders_male [player_confirmed_1, player_8, player_9] "marcos.tirao@icloud.com" "game_17" 20000
game_confirm_3 = Game status_inviting gameDetail_confirm_3
game_postulated_1 = Game status_inviting gameDetail_6


game_1 = Game status_canceled gameDetail_1
game_2 = Game status_confirmed gameDetail_2
game_3 = Game status_inviting gameDetail_3
game_4 = Game status_inviting gameDetail_4
game_5 = Game status_confirmed gameDetail_5
game_6 = Game status_inviting gameDetail_7
game_postulable_1 = Game status_postulable gameDetail_postulable_1
game_postulable_2 = Game status_postulable gameDetail_postulable_2
game_postulable_3 = Game status_postulable gameDetail_postulable_3
game_postulable_4 = Game status_postulable gameDetail_postulable_4
game_postulable_5 = Game status_postulable gameDetail_postulable_5


game_finished_1 = Game status_finished gameDetail_finished_1
game_finished_2 = Game status_finished gameDetail_finished_2
game_finished_3 = Game status_finished gameDetail_finished_3
game_finished_4 = Game status_finished gameDetail_finished_4
game_finished_5 = Game status_finished gameDetail_finished_5


games = [game_1, game_2, game_3, game_4, game_5, game_6, 
        game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5,
        game_finished_1, game_finished_2, game_finished_3, game_finished_4, game_finished_5 ]



filterGames :: [Game] -> Status -> [Game]
filterGames [] _ = []
filterGames (x:xs) status = if (game_status x) == status then x:filterGames xs status
                            else filterGames xs status

filterGamesMultipleStatus :: [Game] -> [Status] -> [Game]
filterGamesMultipleStatus [] _ = []
filterGamesMultipleStatus (x:xs) status = if (game_status x) `elem` status then x:filterGamesMultipleStatus xs status
                            else filterGamesMultipleStatus xs status


listGames :: [Game] -> Status -> Text -> Games
listGames xs status url = Games "" (filterGames xs status) 10 url

listGameMultipleStatus :: [Game] -> [Status] -> Text -> Games
listGameMultipleStatus xs status url = Games "" (filterGamesMultipleStatus xs status) 10 url
