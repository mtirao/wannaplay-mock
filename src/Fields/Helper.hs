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

location_1 = Location 0.0 0.0

field_1 = Field "El Protrero Soccer 1" "Belgrano, CABA." "Av. Cabildo 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 1 1 location_1
field_2 = Field "El Protrero Soccer 2" "Belgrano, CABA." "Av. Libertador 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 2 2 location_1
field_3 = Field "El Protrero Soccer 3" "Devoto, CABA." "Av. Beiro 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 3 3 location_1
field_4 = Field "El Protrero Soccer 4" "Monte Castro, CABA." "Av. Alvarez Jonte 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 3 4 location_1
field_5 = Field "El Protrero Soccer 5" "Almagro, CABA." "Av. San Martin 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 4 5 location_1
field_6 = Field "El Protrero Soccer 6" "Belgrano, CABA." "Av. Chivilcoy 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 5 6 location_1
field_7 = Field "El Protrero Soccer 7" "Belgrano, CABA." "Av. Belgrano 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" amenities_1 sport_1 0 7 location_1

