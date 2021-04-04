module Main exposing (..)

import Browser
import Colors exposing (apple, blue, blueGrey, blueTransparent, blueyGrey, charcoalGrey, greenBlue, lightBlueGrey, paleGrey, tangerine, white, withOpacity)
import Element exposing (Element, alignLeft, alignRight, centerX, centerY, column, el, fill, height, maximum, padding, paddingEach, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)



-- import Html.Attributes exposing (src)
---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


edges : { top : number, right : number, bottom : number, left : number }
edges =
    { top = 0
    , right = 0
    , bottom = 0
    , left = 0
    }


type alias Person =
    { name : String
    , collector : String
    , amount : Int
    }


persons : List Person
persons =
    [ { name = "David"
      , collector = "Bowie"
      , amount = 100000
      }
    , { name = "Florence"
      , collector = "Welch"
      , amount = 200000
      }
    ]


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.color paleGrey ]
        (column [ Background.color white, centerX, height fill, width (fill |> maximum 960) ]
            [ row [ paddingEach { edges | top = 20, bottom = 40 }, centerX ]
                [ el
                    [ Font.size 36
                    , Font.color charcoalGrey
                    ]
                    (text "Distributed Business")
                ]
            , row [ paddingEach { edges | top = 40, left = 20 }, alignLeft ]
                [ el
                    [ Font.size 24
                    , Font.color charcoalGrey
                    ]
                    (text "Investors :")
                ]
            , el [ padding 20, Background.color white, width fill ]
                (Element.table [ Background.color (withOpacity blue 0.1), padding 20, Border.rounded 20 ]
                    { data = persons
                    , columns =
                        [ { header = el [ Font.color blue, Font.size 18, padding 10 ] (text "Investor's Name")
                          , width = fill
                          , view =
                                \person ->
                                    el [ Font.size 16, padding 8 ] (text person.name)
                          }
                        , { header = el [ Font.color blue, Font.size 18, padding 10 ] (text "Collector")
                          , width = fill
                          , view =
                                \person ->
                                    el [ Font.size 16, padding 8 ] (text person.collector)
                          }
                        , { header = el [ Font.color blue, Font.size 18, padding 10 ] (text "Amount")
                          , width = fill
                          , view =
                                \person ->
                                    el [ Font.size 16, padding 8 ] (text <| String.fromInt person.amount)
                          }
                        ]
                    }
                )
            ]
        )



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
