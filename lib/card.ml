open! Core

module Rank = struct
  module Pip = struct
    type t =
    | One
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
    | One -> 1
    | Two -> 2
    | Three -> 3
    | Four -> 4
    | Five -> 5
    | Six -> 6
    | Seven -> 7
    | Eight -> 8
    | Nine -> 9
    | Ten -> 10
  end

  module Face = struct
    module Ace = struct
      type t

      module Possible_values = struct
        type t = One | Eleven
        
        let value = function
        | One -> 1
        | Eleven -> 11
      end
    end
    
    type t = King | Queen | Jack
    [@@deriving sexp_of, enumerate]

    let value = function
    | King | Queen | Jack -> 10
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