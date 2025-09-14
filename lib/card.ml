open! Core

module Rank = struct
  module Pip = struct
    type t =
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine
    | Ten
  [@@deriving sexp_of, enumerate]
  
    let value = function
    | Two -> `Two
    | Three -> `Three
    | Four -> `Four
    | Five -> `Five
    | Six -> `Six
    | Seven -> `Seven
    | Eight -> `Eight
    | Nine -> `Nine
    | Ten ->  `Ten
  end

  module Face = struct
    type t = King | Queen | Jack | Ace
    [@@deriving sexp_of, enumerate]

    let value = function
    | King | Queen | Jack -> `Ten
    (* the actual value of an Ace will be determined during the game, depending on the value of the rest of the hand *)
    | Ace -> `One_or_eleven
  end

  type t = 
  | Face of Face.t
  | Pip of Pip.t
  [@@deriving sexp_of, enumerate]
end

module Suit = struct
  type t = Hearts | Diamonds | Spades | Clubs
  [@@deriving sexp_of, enumerate]
end

type t = Rank.t * Suit.t 
[@@deriving sexp_of]