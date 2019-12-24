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

data FieldType = FieldType 
    { sport :: Text
    , players :: [Int]
    }

data Location = Location 
    { latitude :: Double
    , longitude :: Double
    }

data Field = Field
    { name :: Text
    , city :: Text
    , address  :: Text
    , phone :: Text
    , cell_phone :: Text
    , url :: Text
    , amenities :: [Text]
    , field_type :: FieldType
    , score :: Int
    , id :: Int
    , location :: Location
    }



data Time = Time 
    { available_time :: [Text]
    }
