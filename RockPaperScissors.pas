uses crt;
Var 
    player, cpu, uwincount, cwincount, tiecount, playcount :   Integer;
    Playerinput :   String;

Function winlosetie(player : Integer):   String; {player}{rockR0, paperP1, scissorS2}
Begin
    Randomize;
    CPU := Random(3);
    Case cpu Of 
        0:   Writeln('CPU: Rock');
        1:   Writeln('CPU: Paper');
        2:   Writeln('CPU: Scissor');
    End;
    If cpu = player Then
        Begin
            winlosetie := 'Tie';
            tiecount := tiecount+1
        End
    Else If ((player = 0) And (cpu = 1)) Or ((player = 1) And (cpu = 2)) Or ((
            player = 2) And (cpu = 0
            ))
             Then
             Begin
                 winlosetie := 'Lose';
                 cwincount := cwincount +1;
             End

    Else If ((player = 1) And (cpu = 0)) Or ((player = 2) And (cpu = 1)) Or ((
            player = 0) And (cpu = 2
            ))
             Then
             Begin
                 winlosetie := 'Win';
                 uwincount := uwincount +1;
             End
    Else
        Writeln('winlosetie error');
End;

procedure center(str:String; ln:integer);
begin
  GotoXY((80 - length(Str)) div 2, ln);
  write(str);
end;

{main}
Begin
    center('welcome to the game', 1);
    Writeln;
    playcount := 1;
    Repeat
        Writeln('Your play, Enter (R)ock, (P)aper, (S)cissors. Play', playcount,
                '/5' );
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
        Else Writeln('invalid.');
        Writeln(winlosetie(player));
        playcount := playcount + 1;
    Until (Playcount=6);

    Playcount := playcount -1;
    Writeln('You have played 5 times. Win: ', uwincount, ', Lose: ', cwincount,
            'Tie: ',tiecount
    );
    Readln;
    Readln;
End.
