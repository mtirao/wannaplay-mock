{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Games.Games where

import Games.Json
import Games.Types
import Games.Helper
import Foundation
import Data.Text (Text)
import Yesod.Core




getGamesR  :: Handler Value
getGamesR = do 
    pageValueMaybe <- lookupGetParam "page"
    case pageValueMaybe of
        Nothing -> returnJson $ listGameMultipleStatus games [status_inviting, status_confirmed, status_canceled] ""
        Just page -> case page of
            "0" -> returnJson $ listGameMultipleStatus games [status_inviting, status_confirmed, status_canceled] "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games?page=1"
            "1" -> returnJson $ listGameMultipleStatus games [status_inviting, status_confirmed, status_canceled] "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games?page=2"
            "2" -> returnJson $ listGameMultipleStatus games [status_inviting, status_confirmed, status_canceled] ""
            _ -> returnJson $ listGameMultipleStatus [] [status_inviting, status_confirmed, status_canceled] ""
            

getFinishedGamesR  :: Handler Value
getFinishedGamesR= do 
        pageValueMaybe <- lookupGetParam "page"
        case pageValueMaybe of
            Nothing -> returnJson $ listGames games status_finished ""
            Just page -> case page of
                "0" -> returnJson $ listGames games status_finished "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/finished?page=1"
                "1" -> returnJson $ listGames games status_finished "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/finished?page=2"
                "2" -> returnJson $ listGames games status_finished ""
                _ -> returnJson $ listGames [] status_finished ""



getPostulaleGamesR  :: Handler Value
getPostulaleGamesR = do
    pageValueMaybe <- lookupGetParam "page"
    case pageValueMaybe of
        Nothing -> returnJson $ listGames games status_postulable ""
        Just page -> case page of
            "0" -> returnJson $ listGames games status_postulable "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/postulable?page=1" 
            "1" -> returnJson $ listGames games status_postulable "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/postulable?page=2" 
            "2" -> returnJson $ listGames games status_postulable "" 
            _ -> returnJson $ listGames [] status_postulable ""

getInviteGamesR :: Int -> Handler Value
getInviteGamesR player = do 
    pageValueMaybe <- lookupGetParam "page"
    case pageValueMaybe of
        Nothing -> returnJson $ listGames games status_inviting ""
        Just page -> case page of
            "0" -> returnJson $ listGames games status_inviting "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/invite?page=1" 
            "1" -> returnJson $ listGames games status_inviting "http://ec2-18-191-142-90.us-east-2.compute.amazonaws.com:3000/players/games/invite?page=2" 
            "2" -> returnJson $ listGames games status_inviting "" 
            _ -> returnJson $ listGames [] status_inviting ""

getGameDetailR :: Int -> Handler Value
getGameDetailR   game_id = returnJson $ game_1

getGamePlayersR :: Int -> Handler Value
getGamePlayersR game_id = returnJson $ Players "" [player_1, player_2, player_3, player_4] 10 ""

patchGameTeamR :: Int -> Int -> Handler Value
patchGameTeamR game_id player_id = returnJson $ player_1

patchGameColorR :: Int -> Handler Value
patchGameColorR game_id = returnJson $ game_1

patchGameConfirmR :: Int -> Int -> Handler Value
patchGameConfirmR game_id player_id = returnJson $ game_1

patchGameCancelR :: Int -> Int -> Handler Value
patchGameCancelR game_id player_id = returnJson $ game_1

patchGamePostulateR :: Int -> Int -> Handler Value
patchGamePostulateR game_id player_id = returnJson $ game_1

getGameMutimediaR :: Int -> Handler Value
getGameMutimediaR game_id = returnJson $ Assets "" ["https://image.shutterstock.com/image-vector/soccer-player-ball-stadium-light-600w-731216308.jpg","https://image.shutterstock.com/image-vector/soccer-player-ball-stadium-light-600w-731216308.jpg"] 10 ""

patchGamePostulatedR :: Int -> Handler Value 
patchGamePostulatedR game_id = returnJson $ game_postulated_1

getGameFilterR :: Handler Value 
getGameFilterR = returnJson $ Games "" [game_postulable_1, game_postulable_2, game_postulable_3, game_postulable_4, game_postulable_5] 10 ""

patchGameOwnConfirmR :: Int -> Handler Value
patchGameOwnConfirmR game_id = returnJson $ game_confirm_3

patchGameOwnCancelR :: Int -> Handler Value
patchGameOwnCancelR game_id = returnJson $ game_3

patchGameOwnPostulatedR :: Int -> Handler Value
patchGameOwnPostulatedR game_id = returnJson $ game_3

postGameCreateR :: Handler Value
postGameCreateR = returnJson $ game_3


patchGameCaptainR :: Int -> Int -> Handler Value
patchGameCaptainR game_id player_id = returnJson $ game_1

putGamePlayersR :: Int -> Handler Value
putGamePlayersR game_id = returnJson $ game_1