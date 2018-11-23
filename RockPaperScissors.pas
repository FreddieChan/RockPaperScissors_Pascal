Uses crt;

Var 
  player, cpu, uwincount, cwincount, Drawcount, playcount : Integer;
  Playerinput : String;
Function winloseDraw(player : Integer): String; {player}
{rockR0, paperP1, scissorS2}
Begin
  cursoroff;
  Randomize;
  CPU := Random(3);
  Writeln;
  Case cpu Of 
    0:
       Begin
         Writeln('CPU: ');
         Writeln('                _    ');
         Writeln('               | |   ');
         Writeln(' _ __ ___   ___| | __');
         Writeln('| |__/ _ \ / __| |/ /');
         Writeln('| | | (_) | (__|   < ');
         Writeln('|_|  \___/ \___|_|\_\');
       End;
    1:
       Begin
         Writeln('CPU: ');
         Writeln(' _ __   __ _ _ __   ___ _ __ ');
         Writeln('|  _ \ / _` |  _ \ / _ \  __|');
         Writeln('| |_) | (_| | |_) |  __/ |   ');
         Writeln('| .__/ \__,_| .__/ \___|_|   ');
         Writeln('| |         | |              ');
         Writeln('|_|         |_|              ');
       End;
    2:
       Begin
         Writeln('CPU: ');
         Writeln('          _                        ');
         Writeln('         (_)                       ');
         Writeln(' ___  ___ _ ___ ___  ___  _ __ ___ ');
         Writeln('/ __|/ __| / __/ __|/ _ \|  __/ __|');
         Writeln('\__ \ (__| \__ \__ \ (_) | |  \__ \');
         Writeln('|___/\___|_|___/___/\___/|_|  |___/');
       End;
  End;
  Writeln;
  If cpu = player Then
    Begin
      winloseDraw := 'Draw!';
      Drawcount := Drawcount+1
    End
  Else If ((player = 0) And (cpu = 1)) Or ((player = 1) And (cpu = 2)) Or ((
          player = 2) And (cpu = 0
          ))
         Then
         Begin
           winloseDraw := 'Lose!';
           cwincount := cwincount +1;
         End
  Else If ((player = 1) And (cpu = 0)) Or ((player = 2) And (cpu = 1)) Or ((
          player = 0) And (cpu = 2
          ))
         Then
         Begin
           winloseDraw := 'Win!';
           uwincount := uwincount +1;
         End
  Else
    Writeln('winLoseDraw error');
End;
Procedure center(Str:String; Ln:Integer);
Begin
  Gotoxy((80 - Length(Str)) div 2, Ln);
  Write(Str);
End;
{main}
Begin
  center('Welcome to the game', 1);
  center('>Press any key to play.',2);
  Readkey;
  Clrscr;
  playcount := 1;
  Repeat
    Writeln;
    Writeln('Enter (R)ock, (P)aper, (S)cissors. Play', playcount,
            '/5' );
    playerinput := Upcase(Readkey);
 {}
    If (playerinput ='P' ) Or (playerinput ='S' ) Or (playerinput = 'R')Then
      Begin
        Writeln('Your play:');
        If playerinput = 'R' Then
          Begin
            Writeln('                _    ');
            Writeln('               | |   ');
            Writeln(' _ __ ___   ___| | __');
            Writeln('| |__/ _ \ / __| |/ /');
            Writeln('| | | (_) | (__|   < ');
            Writeln('|_|  \___/ \___|_|\_\');
            player := 0;
          End
        Else If 
                playerinput = 'P' Then
               Begin
                 Writeln(' _ __   __ _ _ __   ___ _ __ ');
                 Writeln('|  _ \ / _` |  _ \ / _ \  __|');
                 Writeln('| |_) | (_| | |_) |  __/ |   ');
                 Writeln('| .__/ \__,_| .__/ \___|_|   ');
                 Writeln('| |         | |              ');
                 Writeln('|_|         |_|              ');
                 player := 1;
               End
        Else If 
                playerinput = 'S' Then
               Begin
                 Writeln('          _                        ');
                 Writeln('         (_)                       ');
                 Writeln(' ___  ___ _ ___ ___  ___  _ __ ___ ');
                 Writeln('/ __|/ __| / __/ __|/ _ \|  __/ __|');
                 Writeln('\__ \ (__| \__ \__ \ (_) | |  \__ \');
                 Writeln('|___/\___|_|___/___/\___/|_|  |___/');
                 player := 2;
               End;
        Writeln(winloseDraw(player));
        playcount := playcount + 1;
      End
    Else Writeln('Try again');
  Until (Playcount=6);
  Playcount := playcount -1;
  WriteLn;
  Writeln('You have played 5 times. Win: ', uwincount, ', Lose: ', cwincount,
          ', Draw: ',Drawcount
  );
  Readln;
  Readln;
End.
