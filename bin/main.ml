open! Core

let () =
Blackjack.Deck.full_deck
|> List.iter ~f:(fun card -> print_s (Blackjack.Card.sexp_of_t card)); let count = List.length Blackjack.Deck.full_deck in print_endline [%string "there are %{count#Int} cards in the full_deck value"]
