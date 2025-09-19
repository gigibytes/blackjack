open! Core

type t = { stack : int ; hand : Card.t list }
[@@deriving fields]

(* the new card should come from calling Deck.draw in the main game flow *)
(* Return a new hand with an additional card added to it *)
let hit ~new_card t = { t with hand = new_card :: t.hand }

(* Get the score for the player passed in *)
let score t = Card.Hand.calculate_value t.hand
