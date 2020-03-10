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

data DepField = 
    { name :: Text
    , material :: Text
    , id :: Int
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
    , depending_fields :: [DepField]
    , id :: Int
    , club_id :: Int
    }



data Time = Time 
    { available_time :: [Text]
    }
