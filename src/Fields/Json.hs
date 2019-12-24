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
        , "city" .= city
        , "address" .= address
        , "phone" .= phone
        , "cell_phone" .= cell_phone
        , "url" .= url
        , "amenities" .= amenities
        , "field_type" .= field_type
        , "score" .= score
        , "id" .= id
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
        