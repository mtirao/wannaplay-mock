{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Minimal Multifile"
    [whamlet|
        <p>
            <a href=@{AddR}>HTML addition
        <p>
            <a href=@{AddR}?_accept=application/json>JSON addition
    |]
