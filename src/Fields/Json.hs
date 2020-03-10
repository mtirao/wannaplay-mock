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
        , "total_amount" .= toal_amount
        , "services" .= services
        , "depending_fields" .= depending_fields
        , "cell_phone" .= cell_phone
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

instance ToJSON DepField where 
    toJSON DepField {..} = object
        ["name" .= name
        ,"material" .= material
        ,"id" .= id
        ]

instance ToJSON Service where
    toJSON Service {..} = object
        ["code" .= code
        ,"description" .= description
        ]

