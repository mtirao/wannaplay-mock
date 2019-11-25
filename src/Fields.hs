{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE RecordWildCards       #-}

module Fields where

import Foundation
import Data.Text (Text)
import Yesod.Core

data Fields = Fields
    { previous :: Text
    , results :: [Field]
    , count  :: Int
    , next :: Text
    }

instance ToJSON Fields where
    toJSON Fields {..} = object
        [ "previous" .= previous
        , "results" .= results
        ,  "count" .= count
        ,  "next" .= next
        ]


data Field = Field
    { name :: Text
    , city :: Text
    , address  :: Text
    , phone :: Text
    , cell_phone :: Text
    , url :: Text
    , amenities :: Text
    , field_type :: Text
    , score :: Int
    }

instance ToJSON Field  where
    toJSON Field {..} = object
        [ "name" .= name
        , "city" .= city
        , "address" .= address
        , "phone" .= phone
        , "cell_phone" .= cell_phone
        , "url" .= url
        , "amenities" .= amenities
        , "field_type" .= field_type
        , "score" .= score
        ]

field_1 = Field "El Protrero Soccer 1" "Belgrano, CABA." "Av. Cabildo 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 1
field_2 = Field "El Protrero Soccer 2" "Belgrano, CABA." "Av. Libertador 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 2 
field_3 = Field "El Protrero Soccer 3" "Devoto, CABA." "Av. Beiro 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 3
field_4 = Field "El Protrero Soccer 4" "Monte Castro, CABA." "Av. Alvarez Jonte 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 3
field_5 = Field "El Protrero Soccer 5" "Almagro, CABA." "Av. San Martin 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 4
field_6 = Field "El Protrero Soccer 6" "Belgrano, CABA." "Av. Chivilcoy 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 5
field_7 = Field "El Protrero Soccer 7" "Belgrano, CABA." "Av. Belgrano 4000" "11 1234-5678" "11 1234-34567" "www.someurl.com" "Cesped Sintetico - Techada - Iluminicion" "Futbol 7 - 9 - 11" 1



getFieldsR  :: Handler Value
getFieldsR  = returnJson $ Fields "" [field_1, field_2, field_3, field_4, field_5, field_6, field_7] 10 ""