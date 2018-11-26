
Program RockPaperScissors;

Uses crt;

Var 
    player, cpu, uwincount, cwincount, drawCount, playCount :   Integer;
    Playerinput :   String;

Function WinLoseDraw(player : Integer) :   String;
{rockR0, paperP1, scissorS2}
Begin
    cursoroff;
    Randomize;
    CPU := Random(3);
    WriteLn;
    Case cpu Of 
        0:
             Begin
                 WriteLn('CPU: ');
                 WriteLn('                _    ');
                 WriteLn('               | |   ');
                 WriteLn(' _ __ ___   ___| | __');
                 WriteLn('| |__/ _ \ / __| |/ /');
                 WriteLn('| | | (_) | (__|   < ');
                 WriteLn('|_|  \___/ \___|_|\_\');
             End;
        1:
             Begin
                 WriteLn('CPU: ');
                 WriteLn(' _ __   __ _ _ __   ___ _ __ ');
                 WriteLn('|  _ \ / _` |  _ \ / _ \  __|');
                 WriteLn('| |_) | (_| | |_) |  __/ |   ');
                 WriteLn('| .__/ \__,_| .__/ \___|_|   ');
                 WriteLn('| |         | |              ');
                 WriteLn('|_|         |_|              ');
             End;
        2:
             Begin
                 WriteLn('CPU: ');
                 WriteLn('          _                        ');
                 WriteLn('         (_)                       ');
                 WriteLn(' ___  ___ _ ___ ___  ___  _ __ ___ ');
                 WriteLn('/ __|/ __| / __/ __|/ _ \|  __/ __|');
                 WriteLn('\__ \ (__| \__ \__ \ (_) | |  \__ \');
                 WriteLn('|___/\___|_|___/___/\___/|_|  |___/');
             End;
    End;
    WriteLn;
    If cpu = player Then
        Begin
            WinLoseDraw := 'Draw!';
            drawCount := drawCount+1
        End
    Else If (player = 0) And (cpu = 1) Or (player = 1) And (cpu = 2) Or (
            player = 2) And (cpu = 0) Then
             Begin
                 WinLoseDraw := 'Lose!';
                 cwincount := cwincount +1;
             End
    Else If (player = 1) And (cpu = 0) Or (player = 2) And (cpu = 1) Or (
            player = 0) And (cpu = 2) Then
             Begin
                 WinLoseDraw := 'Win!';
                 uwincount := uwincount +1;
             End
    Else
        WriteLn('WinLoseDraw error');
End;
Procedure center(Str : String; Ln : Integer);
Begin
    GoToXY((80 - Length(Str)) div 2, Ln);
    Write(Str);
End;

(* Main *)
Begin
    center('Welcome to the game', 1);
    center('>Press any key to play.', 2);
    Readkey;
    Clrscr;
    playCount := 1;
    Repeat
        WriteLn;
        WriteLn('Enter (R)ock, (P)aper, (S)cissors. Play', playCount,
                '/5' );
        playerinput := Upcase(Readkey);
        If (playerinput = 'P') Or (playerinput = 'S') Or (playerinput = 'R')
            Then
            Begin
                WriteLn('Your play:');
                If playerinput = 'R' Then
                    Begin
                        WriteLn('                _    ');
                        WriteLn('               | |   ');
                        WriteLn(' _ __ ___   ___| | __');
                        WriteLn('| |__/ _ \ / __| |/ /');
                        WriteLn('| | | (_) | (__|   < ');
                        WriteLn('|_|  \___/ \___|_|\_\');
                        player := 0;
                    End
                Else If playerinput = 'P' Then
                         Begin
                             WriteLn(' _ __   __ _ _ __   ___ _ __ ');
                             WriteLn('|  _ \ / _` |  _ \ / _ \  __|');
                             WriteLn('| |_) | (_| | |_) |  __/ |   ');
                             WriteLn('| .__/ \__,_| .__/ \___|_|   ');
                             WriteLn('| |         | |              ');
                             WriteLn('|_|         |_|              ');
                             player := 1;
                         End
                Else If playerinput = 'S' Then
                         Begin
                             WriteLn('          _                        ');
                             WriteLn('         (_)                       ');
                             WriteLn(' ___  ___ _ ___ ___  ___  _ __ ___ ');
                             WriteLn('/ __|/ __| / __/ __|/ _ \|  __/ __|');
                             WriteLn('\__ \ (__| \__ \__ \ (_) | |  \__ \');
                             WriteLn('|___/\___|_|___/___/\___/|_|  |___/');
                             player := 2;
                         End;
                WriteLn(WinLoseDraw(player));
                playCount := playCount + 1;
            End
        Else WriteLn('Try again');
    Until playCount = 6;
    (* playCount := playCount - 1; *)
    WriteLn;
    WriteLn('You have played 5 times. Win: ', uwincount, ', Lose: ', cwincount,
            ', Draw: ', drawCount);
    WriteLn('Press any key to exit...');
    ReadKey;
End.
