{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Games.Json where

import Games.Types
import Foundation
import Data.Text (Text)
import Yesod.Core
import Fields.Types
import Fields.Json


instance ToJSON Club where
    toJSON Club {..} = object [
        "id" .= club_id
        ,"street_address" .= street_address
        ,"name" .= name
        ,"city" .= city
        ,"location" .= location
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
        ,"is_friend" .= is_friend
        ,"last_name" .= last_name
        ,"team" .= team
        ,"first_name" .= first_name
        ,"username" .= username
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
        , "created_by" .= created_by
        , "chat_id" .= chat_id
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
