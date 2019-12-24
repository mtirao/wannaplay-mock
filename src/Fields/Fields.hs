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
getFieldsR  = returnJson $ Fields "" [field_1, field_2, field_3, field_4, field_5, field_6, field_7] 10 ""

getTimesR  :: Int -> Handler Value
getTimesR _ = returnJson $ time_1