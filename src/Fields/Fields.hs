{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Fields.Fields where


import Fields.Json
import Fields.Types
import Fields.Helper
import Foundation
import Data.Text (Text)
import Yesod.Core



getFieldsR  :: Handler Value
getFieldsR  = returnJson $ Clubs "" [club_1, club_2, club_3, club_4] 4 ""

getTimesR  :: Int -> Handler Value
getTimesR _ = returnJson $ time_1