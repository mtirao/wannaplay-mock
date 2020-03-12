{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Fields.Json where

import Fields.Types
import Foundation
import Data.Text (Text)
import Yesod.Core

instance ToJSON Field  where
    toJSON Field {..} = object
        [ "name" .= name
        ,"material" .= material
        , "max_players" .= max_players
        , "total_amount" .= total_amount
        , "services" .= services
        , "id" .= id
        , "club_id" .= club_id
        ]

instance ToJSON Time  where
    toJSON Time {..} = object
        [ "available_time" .= available_time
        ]

instance ToJSON Location where
    toJSON Location {..} = object
        [ "latitude" .= latitude
        , "longitude" .= longitude
        ]


instance ToJSON FieldType where
    toJSON FieldType {..} = object
        [ "type" .= sport
        , "players" .= players
        ]

instance ToJSON Fields where
    toJSON Fields {..} = object
        [ "previous" .= previous
        , "results" .= results
        ,  "count" .= count
        ,  "next" .= next
        ]

instance ToJSON Clubs where
    toJSON Clubs {..} = object
        [ "previous" .= previous_club
        , "results" .= results_club
        ,  "count" .= count_club
        ,  "next" .= next_club
        ]

instance ToJSON Service where
    toJSON Service {..} = object
        ["code" .= code
        ,"description" .= description
        ]

instance ToJSON Club where
    toJSON Club {..} = object [
        "id" .= id_club
        ,"street_address" .= street_address
        ,"name" .= name_club
        ,"city" .= city
        ,"city_area" .= city_area
        ,"services" .= services_club
        ,"description" .= description_club
        ,"primary_phone" .= primary_phone
        ,"secondary_phone" .= secondary_phone
        ,"country" .= country
        ,"country_area" .= country_area
        ,"postal_code" .= postal_code
        ,"location" .= location
        ]
