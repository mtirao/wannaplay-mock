{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Games.Types where

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
    } deriving (Eq)

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
    ,created_by :: Text
    }

data Assets = Assets {
     previous_assets :: Text
    , results_assets :: [Text]
    , count_assets  :: Int
    , next_assets :: Text
    }
