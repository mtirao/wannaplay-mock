{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Fields.Helper where

import Fields.Types
import Foundation
import Data.Text (Text)
import Yesod.Core

sport_1 =  FieldType "Soccer" [5,6,7,8,9,10]

time_1 = Time ["8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

amenities_1 = ["Cesped", "Sintetico", "Techada",  "Iluminicion"]

location_1 = Location (-34.62101) (-58.4962054)
location_2 = Location (-34.598015) (-58.4946737)
location_3 = Location (-34.622174) (-58.5084067)
location_4 = Location (-34.633121) (-58.5172477)
location_5 = Location (-34.67746) (-58.4659207)
location_6 = Location (-34.556249) (-58.4418877)
location_7 = Location (-34.54561) (-58.4536467)

service_1 = Service "bar" "bar"

field_1 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 1 1 
field_2 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 2 2 
field_3 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 3 3 
field_4 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 4 4 
field_5 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 5 5 
field_6 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 6 6 
field_7 = Field "El Protrero Soccer 1" "cesped" 8 100.10 [service_1] 7 7 

club_1 = Club 1 "Ortiz de Ocampo 1500" "Ocampo Futbol" "Vicente Lopez" "Buenos Aires"  location_1 [] [service_1] "bla bla" "12345678" "12345678" "AR" "Argentina" "1417"
club_2 = Club 2 "Ortiz de Ocampo 1500" "Ocampo Futbol" "Vicente Lopez" "Buenos Aires"  location_1 [] [service_1] "bla bla" "12345678" "12345678" "AR" "Argentina" "1417"
club_3 = Club 3 "Ortiz de Ocampo 1500" "Ocampo Futbol" "Vicente Lopez" "Buenos Aires"  location_1 [] [service_1] "bla bla" "12345678" "12345678" "AR" "Argentina" "1417"
club_4 = Club 4 "Ortiz de Ocampo 1500" "Ocampo Futbol" "Vicente Lopez" "Buenos Aires"  location_1 [] [service_1] "bla bla" "12345678" "12345678" "AR" "Argentina" "1417"
