{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE ViewPatterns      #-}
module Foundation where

import ClassyPrelude.Yesod
import Control.Monad.IO.Class  (liftIO)
import Yesod.Core
import Yesod
import Database.Persist
import Database.Persist.TH
import Database.Persist.Sqlite
import Control.Monad.Trans.Resource (runResourceT)
import Control.Monad.Logger (runStderrLoggingT)
import Database.Persist.Quasi
import Data.Text (Text)

data App = App

mkYesodData "App" $(parseRoutesFile "routes")

instance Yesod App

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")


data PersistTest = PersistTest ConnectionPool

instance YesodPersist PersistTest where
    type YesodPersistBackend PersistTest = SqlBackend

    runDB action = do
        PersistTest pool <- getYesod
        runSqlPool action pool

