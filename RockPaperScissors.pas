 Var
      player, cpu, uwincount, cwincount, playcount : Integer;
      Playerinput : String;

Function winlosetie(player : Integer): String; {player}
{rockR0, paperP1, scissorS2}
Begin
  Randomize;
  CPU := Random(3);
  Case cpu Of
    0: Writeln('Rock');
    1: Writeln('Paper');
    2: Writeln('Scissor');
  End;
  If cpu = player Then
    winlosetie := 'Tie'
  Else If ((player = 0) And (cpu = 1)) Or ((player = 1) And (cpu = 2)) Or ((player = 2) And (cpu = 0
          ))
         Then
         winlosetie := 'Lose'
  Else If ((player = 1) And (cpu = 0)) Or ((player = 2) And (cpu = 1)) Or ((player = 0) And (cpu = 2
          ))
         Then
         winlosetie := 'Win'
  Else
    Writeln('winlosetie error');
End;
Begin
  Writeln('welcome to the game');
  Repeat
    Writeln('Your play, Enter (R)ock, (P)aper, (S)tone. Play', playcount, '/5' );
    Readln(playerinput);
    If playerinput = 'R' Then
      Begin
        Writeln('Rock');
        player := 0;
      End
    Else If
            playerinput = 'P' Then
           Begin
             Writeln('Paper');
             player := 1;
           End
    Else If
            playerinput = 'S' Then
           Begin
             Writeln('Scissors');
             player := 2;
           End
    Else Writeln('invalid');
    Writeln(winlosetie(player));
    playcount := playcount + 1;
  Until (Playcount=5);
  Writeln('You have played', playcount,'times. Win: ', uwincount, ', Lose: ',playcount - uwincount
  );
  Readln;
End.
