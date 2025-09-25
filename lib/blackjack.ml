open! Core

module Card = Card
module Deck = Deck
module Player = Player

module Game = struct
  let fresh_deck = Deck.full_deck
  let shuffled_deck = Deck.shuffle fresh_deck

  let get_card_and_update_deck deck =
    let new_card, new_deck = Deck.draw deck
    in
    ((Option.value_exn ~message:"Unable to draw a card!" new_card), new_deck)
  ;;

  let new_hand deck =
    let first_card, deck' = get_card_and_update_deck deck
    in
    let second_card, deck'' = get_card_and_update_deck deck'
    in
    [first_card; second_card], deck''
  ;;
end

let blackjack name =
  (* TODO start a game with a fresh deck that gets shuffled.
     TODO take a bet from the player.
     TODO deal two cards to the player.
     TODO show the player's current cards and score.
     TODO show the state of player and dealer: good or bust
     TODO take player choice/input in
     TODO loop until someone wins.
     TODO act on stack and ask if they want to play again.
     bonus: keep a leaderboard/store high scores. *)
  (* Is there some kind of terminal formatting module i could use? *)
  (* TODO i think the dealer is really a player with no stack, will think about how to handle/represent that *)
  let initial_player_hand, _shuffled_deck = Game.new_hand Game.shuffled_deck
  in
  let player = Player.{ stack = 0; hand = initial_player_hand }
  in
  print_endline [%string "Hello %{name}! Your hand is: "];
  List.iter player.hand ~f:(fun card ->  Card.sexp_of_t card |> print_s);
  print_endline "Place a bet."

;;

