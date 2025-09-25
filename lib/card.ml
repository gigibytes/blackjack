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

  module Ace = struct
    type t = Ace
    [@@deriving sexp_of, enumerate]
    (* the actual value of an Ace will be determined during the game, depending on the value of the rest of the hand *)
  end

  module Face = struct
    type t = King | Queen | Jack
    [@@deriving sexp_of, enumerate]

    let value = function
    | King | Queen | Jack -> `Ten
  end

  type t =
  | Face of Face.t
  | Pip of Pip.t
  | Ace of Ace.t
  [@@deriving sexp_of, enumerate]
end

module Suit = struct
  type t = Hearts | Diamonds | Spades | Clubs
  [@@deriving sexp_of, enumerate]
end

type t = Rank.t * Suit.t
[@@deriving sexp_of]

let variant_to_int = function
  | `One -> 1
  | `Two -> 2
  | `Three -> 3
  | `Four -> 4
  | `Five -> 5
  | `Six -> 6
  | `Seven -> 7
  | `Eight -> 8
  | `Nine -> 9
  | `Ten -> 10
  | `Eleven -> 11
;;

module Hand = struct
  type t = (Rank.t * Suit.t) list

  let calculate_value (cards : t) =
    (* suit doesn't matter, strip it *)
    let ranks_only = List.map cards ~f:(fun (rank, _suit) -> rank)
    in
    let aces, without_aces =
      List.partition_tf
        ranks_only
        ~f:(function
            | Rank.Ace _ -> true
            | _ -> false)
    in
    (* Tally other card values, then decide what to do with the aces if there are any *)
    let value_without_aces =  without_aces
    |> List.map ~f:(fun rank -> match rank with
      | Rank.Face r -> Rank.Face.value r |> variant_to_int
      | Rank.Pip r -> Rank.Pip.value r |> variant_to_int
      | _ -> 0
      )
    |> List.fold ~f:(+) ~init:0
    in
    if List.length aces > 0 then List.fold aces ~f:(fun acc _ace ->
        (* ignore the actual ace because the only thing that matters is that we have one.
        What we add depends only on the total value of the rest of the cards so far *)
        if value_without_aces <= 10 then (`Eleven |> variant_to_int) + acc
        else (`One |> variant_to_int) + acc
      ) ~init:value_without_aces
    else value_without_aces
end
