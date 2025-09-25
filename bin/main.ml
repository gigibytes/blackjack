open! Core

let blackjack_command =
  Command.basic
    (* One player for now. *)
    ~summary:"Start a game of blackjack against a dealer"
    Command.return (fun () -> Blackjack.blackjack ())
;;

let () = Command_unix.run ~version:"0.1" blackjack_command
