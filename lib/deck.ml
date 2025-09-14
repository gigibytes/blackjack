open! Core

module Deck = struct
  type t = Card.t list

  let full_deck : Card.t list =
    List.fold Card.Suit.all
    ~f:(fun _acc suit -> 
      List.map Card.Rank.all ~f:(fun card -> (card, suit))
      )
    ~init:[]
end

(* should write an expect test here to see if the full_deck val is as expected *)
