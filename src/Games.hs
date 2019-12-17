{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Games where

import Foundation
import Data.Text (Text)
import Yesod.Core

data Games = Games
    { previous :: Text
    , results :: [Game]
    , count  :: Int
    , next :: Text
    }

data Players = Players
    { previous_players :: Text
    , results_players :: [Player]
    , count_players  :: Int
    , next_players :: Text
    }

data Game = Game {
    game_status :: Status
    ,game :: Detail
    }

data Status = Status {
    code :: Text
    }

data Age = Age {
    range_min_age  :: Int
    ,range_max_age  :: Int
    }

data Club = Club {
    club_id :: Int
    ,street_address :: Text
    ,name :: Text
    ,city :: Text
    }

data Field = Field {
    field_id :: Int
    ,total_amount :: Int
    ,max_players :: Int
    ,player_amount :: Int
    }

data PlayerDetail = PlayerDetail {
    player_id :: Int
    ,profile_image_url :: Text
    ,is_captain :: Bool
    ,player_fullname :: Text
    ,team :: Text
    ,first_name :: Text
    ,username :: Text
    }

data Player = Player {
    player :: PlayerDetail
    ,player_status :: Status
    }

data Detail = Detail {
    game_id :: Int
    ,age_range :: Age
    ,club :: Club
    ,start_time :: Text
    ,field :: Field
    ,detail_max_players :: Int
    ,genders :: Text
    ,players :: [Player]
    }

data Assets = Assets {
     previous_assets :: Text
    , results_assets :: [Text]
    , count_assets  :: Int
    , next_assets :: Text
    }

instance ToJSON Club where
    toJSON Club {..} = object [
        "id" .= club_id
        ,"street_address" .= street_address
        ,"name" .= name
        ,"city" .= city
        ]

instance ToJSON Player where
    toJSON Player {..} = object [
        "player" .= player
        ,"status" .= player_status
        ]

instance ToJSON PlayerDetail where
    toJSON PlayerDetail {..} = object [
        "id" .= player_id
        ,"profile_image_url" .= profile_image_url
        ,"is_captain" .= is_captain
        ,"player_fullname" .= player_fullname
        ,"team" .= team
        ,"first_name" .= first_name
        ,"username" .= username
        ]

instance ToJSON Field where
    toJSON Field {..} = object [
        "id" .= field_id
        ,"total_amount" .= total_amount
        ,"max_players" .= max_players
        ,"player_amount" .= player_amount
        ]

instance ToJSON Age where
    toJSON Age {..} = object [
        "min" .= range_min_age
        ,"max" .= range_max_age
        ]

instance ToJSON Detail where
    toJSON Detail {..} = object [
        "id" .= game_id
        ,"age_range" .= age_range
        , "club" .= club
        , "start_datetime" .= start_time
        , "field" .= field
        , "max_players" .= detail_max_players
        , "genders" .= genders
        , "players" .= players
        ]

instance ToJSON Games where
    toJSON Games {..} = object
        [ "previous" .= previous
        , "results" .= results
        ,  "count" .= count
        ,  "next" .= next
        ]

instance ToJSON Players where
    toJSON Players {..} = object
        [ "previous" .= previous_players
        , "results" .= results_players
        ,  "count" .= count_players
        ,  "next" .= next_players
        ]

instance ToJSON Status where
    toJSON Status {..} = object
        [ "code" .= code
        ]



instance ToJSON Game where
    toJSON Game {..} = object
        [ "status" .= game_status
        , "game" .= game
        ]

instance ToJSON Assets where
    toJSON Assets {..} = object
        [ "previous" .= previous_assets
        , "results" .= results_assets
        ,  "count" .= count_assets
        ,  "next" .= next_assets
        ]



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



club_1 = Club 1 "Ortiz de Ocampo 1500" "Ocampo Futbol" "CABA"
club_2 = Club 2 "Salguero 1500" "Salguero Futbol" "CABA"
club_3 = Club 3 "Pedro Moran 3500" "Garden Futbol" "CABA"
club_4 = Club 4 "Duarte Quiros 3500" "Belgrano Futbol" "Cordoba"

field_1 = Field 1 1000 10 100

player_detail_1 = PlayerDetail 1 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Marcos Agustin" "white" "Marcos" "marcos.tirao@icloud.com"
player_detail_2 = PlayerDetail 2 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Agustin Tirao" "black" "Agustin" "agustin.tirao@icloud.com"
player_detail_3 = PlayerDetail 3 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Juan Perez" "white" "Juan" "juan.perez@icloud.com"
player_detail_4 = PlayerDetail 4 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Federico Gomez" "black" "Federico" "fede.gomez@icloud.com"
player_detail_5 = PlayerDetail 5 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Marcos Agustin" "white" "Marcos" "marcos.tirao@icloud.com"
player_detail_6 = PlayerDetail 6 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Fernando Penna" "black" "Fernando" "fer.penna@icloud.com"
player_detail_7 = PlayerDetail 7 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Agustin Tirao" "black" "Agustin" "agustin.tirao@icloud.com"
player_detail_8 = PlayerDetail 8 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" True "Fabio Perez" "white" "Fabio" "fabio.perez@icloud.com"
player_detail_9 = PlayerDetail 9 "https://s3.amazonaws.com/wannaplayprofile/wannaplay-image.png" False "Alejandro Fernandez" "black" "Alejandro" "ale.fernandez@icloud.com"


player_1 =  Player player_detail_1 status_postulated

player_confirmed_1 =  Player player_detail_1 status_confirmed

player_2 =  Player player_detail_2 status_confirmed
player_3 =  Player player_detail_3 status_confirmed
player_4 =  Player player_detail_4 status_declined
player_5 =  Player player_detail_5 status_declined
player_6 =  Player player_detail_6 status_declined
player_7 =  Player player_detail_7 status_confirmed
player_8 =  Player player_detail_8 status_confirmed
player_9 =  Player player_detail_9 status_confirmed
player_10 =  Player player_detail_1 status_postulated

gameDetail_1 = Detail 1 age club_1 "2030-08-22 12:00:00 -0300" field_1 10 genders_male [player_1, player_2, player_3, player_4]
gameDetail_2 = Detail 2 age club_2 "2030-08-23 12:00:00 -0300" field_1 10 genders_male [player_2, player_3, player_7]
gameDetail_3 = Detail 3 age club_3 "2030-08-24 12:00:00 -0300" field_1 10 genders_male [player_1, player_8, player_9]
gameDetail_4 = Detail 4 age club_4 "2030-08-25 12:00:00 -0300" field_1 10 genders_male [player_9, player_5, player_4]
gameDetail_5 = Detail 5 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_1, player_2]
gameDetail_6 = Detail 6 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_10, player_2, player_3, player_4]
gameDetail_7 = Detail 6 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_confirmed_1]


gameDetail_postulable_1 = Detail 1 age club_1 "2030-08-22 12:00:00 -0300" field_1 10 genders_male [player_5, player_2, player_3, player_4]
gameDetail_postulable_2 = Detail 2 age club_2 "2030-08-23 12:00:00 -0300" field_1 10 genders_male [player_2, player_3, player_7]
gameDetail_postulable_3 = Detail 3 age club_3 "2030-08-24 12:00:00 -0300" field_1 10 genders_male [player_7, player_8, player_9]
gameDetail_postulable_4 = Detail 4 age club_4 "2030-08-25 12:00:00 -0300" field_1 10 genders_male [player_9, player_5, player_4]
gameDetail_postulable_5 = Detail 5 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_3, player_2]
gameDetail_postulable_6 = Detail 6 age club_1 "2030-08-26 12:00:00 -0300" field_1 10 genders_male [player_10, player_2, player_3, player_4]


gameDetail_confirm_3 = Detail 1 age club_3 "2030-08-24 12:00:00 -0300" field_1 10 genders_male [player_confirmed_1, player_8, player_9]


gameDetail_finished_1 = Detail 1 age club_1 "2019-07-22 12:00:00 -0300" field_1 10 genders_male [player_1, player_2, player_3, player_4]
gameDetail_finished_2 = Detail 1 age club_2 "2019-07-23 12:00:00 -0300" field_1 10 genders_male [player_2, player_3, player_7]
gameDetail_finished_3 = Detail 1 age club_3 "2019-07-24 12:00:00 -0300" field_1 10 genders_male [player_1, player_8, player_9]
gameDetail_finished_4 = Detail 1 age club_4 "2019-07-25 12:00:00 -0300" field_1 10 genders_male [player_9, player_5, player_4]
gameDetail_finished_5 = Detail 1 age club_1 "2019-07-26 12:00:00 -0300" field_1 10 genders_male [player_1, player_2]


game_1 = Game status_canceled gameDetail_1
game_2 = Game status_confirmed gameDetail_2
game_3 = Game status_inviting gameDetail_3
game_4 = Game status_inviting gameDetail_4
game_5 = Game status_confirmed gameDetail_5
game_6 = Game status_inviting gameDetail_7


game_confirm_3 = Game status_inviting gameDetail_confirm_3


game_finished_1 = Game status_confirmed gameDetail_finished_1
game_finished_2 = Game status_confirmed gameDetail_finished_2
game_finished_3 = Game status_confirmed gameDetail_finished_3
game_finished_4 = Game status_confirmed gameDetail_finished_4
game_finished_5 = Game status_confirmed gameDetail_finished_5

game_postulable_1 = Game status_postulable gameDetail_postulable_1
game_postulable_2 = Game status_postulable gameDetail_postulable_2
game_postulable_3 = Game status_postulable gameDetail_postulable_3
game_postulable_4 = Game status_postulable gameDetail_postulable_4
game_postulable_5 = Game status_postulable gameDetail_postulable_5

game_postulated_1 = Game status_inviting gameDetail_6

getGamesR  :: Handler Value
getGamesR = do 
    pageValueMaybe <- lookupGetParam "page"
    case pageValueMaybe of
        Nothing -> returnJson $ Games "" [game_1, game_2, game_3, game_4, game_5] 10 ""
        Just page -> case page of
            "0" -> returnJson $ Games "" [game_1, game_2, game_3, game_4, game_5] 10 "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games?page=1"
            "1" -> returnJson $ Games "" [game_1, game_2, game_3, game_4, game_5] 10 "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games?page=2"
            "2" -> returnJson $ Games "" [game_1, game_2, game_3, game_4, game_5] 10 ""
            

getFinishedGamesR  :: Handler Value
getFinishedGamesR= do 
        pageValueMaybe <- lookupGetParam "page"
        case pageValueMaybe of
            Nothing -> returnJson $ Games "" [game_finished_1, game_finished_2, game_finished_3, game_finished_4, game_finished_5] 10 ""
            Just page -> case page of
                "0" -> returnJson $ Games "" [game_finished_1, game_finished_2, game_finished_3, game_finished_4, game_finished_5] 10 "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/finished?page=1"
                "1" -> returnJson $ Games "" [game_finished_1, game_finished_2, game_finished_3, game_finished_4, game_finished_5] 10 "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/finished?page=2"
                "2" -> returnJson $ Games "" [game_finished_1, game_finished_2, game_finished_3, game_finished_4, game_finished_5] 10 ""


getPostulaleGamesR  :: Handler Value
getPostulaleGamesR = do
    pageValueMaybe <- lookupGetParam "page"
    case pageValueMaybe of
        Nothing -> returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 ""
        Just page -> case page of
            "0" -> returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/postulable?page=1"
            "1" -> returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/postulable?page=2"
            "2" -> returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 ""
            _ -> returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 ""

getGameDetailR :: Int -> Handler Value
getGameDetailR   game_id = returnJson $ game_1

getGamePlayersR :: Int -> Handler Value
getGamePlayersR game_id = returnJson $ Players "" [player_1, player_2, player_3, player_4] 10 ""

patchGameTeamR :: Int -> Int -> Handler Value
patchGameTeamR game_id player_id = returnJson $ player_1

getGameColorR :: Int -> Handler Value
getGameColorR game_id = returnJson $ game_1

patchGameConfirmR :: Int -> Int -> Handler Value
patchGameConfirmR game_id player_id = returnJson $ game_1

patchGameCancelR :: Int -> Int -> Handler Value
patchGameCancelR game_id player_id = returnJson $ game_1

patchGamePostulateR :: Int -> Int -> Handler Value
patchGamePostulateR game_id player_id = returnJson $ game_1

getGameMutimediaR :: Int -> Handler Value
getGameMutimediaR game_id = returnJson $ Assets "" ["https://image.shutterstock.com/image-vector/soccer-player-ball-stadium-light-600w-731216308.jpg","https://image.shutterstock.com/image-vector/soccer-player-ball-stadium-light-600w-731216308.jpg"] 10 ""

patchGamePostulatedR :: Int -> Handler Value 
patchGamePostulatedR game_id = returnJson $ game_postulated_1

getGameFilterR :: Handler Value 
getGameFilterR = returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 ""

patchGameOwnConfirmR :: Int -> Handler Value
patchGameOwnConfirmR game_id = returnJson $ game_confirm_3

patchGameOwnCancelR :: Int -> Handler Value
patchGameOwnCancelR game_id = returnJson $ game_3

patchGameOwnPostulatedR :: Int -> Handler Value
patchGameOwnPostulatedR game_id = returnJson $ game_3

postGameCreateR :: Handler Value
postGameCreateR = returnJson $ game_3