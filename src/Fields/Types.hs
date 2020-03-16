{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Fields.Types where

import Foundation
import Data.Text (Text)
import Yesod.Core


data Fields = Fields
    { previous :: Text
    , results :: [Field]
    , count  :: Int
    , next :: Text
    }

data Clubs = Clubs
    { previous_club :: Text
    , results_club :: [Club]
    , count_club  :: Int
    , next_club :: Text
    }

data FieldType = FieldType 
    { sport :: Text
    , players :: [Int]
    }

data Location = Location 
    { latitude :: Double
    , longitude :: Double
    }

data Service = Service 
    {code :: Text
    , description :: Text
    }

data Field = Field
    { name :: Text
    , material :: Text
    , max_players  :: Int
    , total_amount :: Float
    , services :: [Service]
    , id :: Int
    , club_id :: Int
    }

data Time = Time 
    { available_time :: [Text]
    }

data Club = Club {
    id_club :: Int
    ,street_address :: Text
    ,name_club :: Text
    ,city :: Text
    ,city_area :: Text
    ,location :: Location
    ,images :: [Text]
    ,services_club :: [Service]
    ,description_club :: Text
    ,primary_phone :: Text
    ,secondary_phone :: Text
    ,country :: Text
    ,country_area :: Text
    ,postal_code :: Text
    ,is_wannaplay :: Bool
    }