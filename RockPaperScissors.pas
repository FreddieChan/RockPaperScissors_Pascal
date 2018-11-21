
Uses crt;

Var 
    player, cpu, uwincount, cwincount, Drawcount, playcount :   Integer;
    Playerinput :   String;

Function winloseDraw(player : Integer):   String; {player}
{rockR0, paperP1, scissorS2}
Begin
    Randomize;
    CPU := Random(3);
    Case cpu Of 
        0:
             Begin
                 Writeln('CPU: Rock');
                 {*                     _    
               | |   
 _ __ ___   ___| | __
| '__/ _ \ / __| |/ /
| | | (_) | (__|   < 
|_|  \___/ \___|_|\_\
                 *}
                 Writeln('');
             End;
        1:   Writeln('CPU: Paper');
        2:
             Begin
                 Writeln('CPU: Scissor');
                 Writeln('          _                        ');

                 Writeln('         (_)                       ');

                 Writeln(' ___  ___ _ ___ ___  ___  _ __ ___ ');

                 Writeln('/ __|/ __| / __/ __|/ _ \|  __/ __|');

                 Writeln('\__ \ (__| \__ \__ \ (_) | |  \__ \');

                 Writeln('|___/\___|_|___/___/\___/|_|  |___/');
             End;
    End;

    If cpu = player Then
        Begin
            winloseDraw := 'Draw';
            Drawcount := Drawcount+1
        End
    Else If ((player = 0) And (cpu = 1)) Or ((player = 1) And (cpu = 2)) Or ((
            player = 2) And (cpu = 0
            ))
             Then
             Begin
                 winloseDraw := 'Lose';
                 cwincount := cwincount +1;
             End

    Else If ((player = 1) And (cpu = 0)) Or ((player = 2) And (cpu = 1)) Or ((
            player = 0) And (cpu = 2
            ))
             Then
             Begin
                 winloseDraw := 'Win';
                 uwincount := uwincount +1;
             End
    Else
        Writeln('winLoseDraw error');
End;

Procedure center(str:String; ln:integer);
Begin
    GotoXY((80 - length(Str)) div 2, ln);
    write(str);
End;

{main}
Begin
    center('Welcome to the game', 1);
    center(#201+ #205+ #205+ #205+ #205+ #205+ #205+ #205+ #205+ #205+ #205,2);
    center('',3);{}
    center('',4);{}
    Delay(2000);
    Clrscr;
    playcount := 1;
    Repeat
        Writeln('Your play, Enter (R)ock, (P)aper, (S)cissors. Play', playcount,
                '/5' );
        playerinput := Upcase(readkey);
        If playerinput = 'R' Then
            Begin
                Writeln('Rock');{REPLACE WITH ASCII ART}
                player := 0;
            End
        Else If 
                playerinput = 'P'   Then
                 Begin
                     Writeln('Paper');{REPLACE WITH ASCII ART}
                     player := 1;
                 End
        Else If 
                playerinput = 'S' Then
                 Begin
                     Writeln('Scissors');{REPLACE WITH ASCII ART}
                     player := 2;
                 End
        Else Writeln('invalid input.');
        Writeln(winloseDraw(player));
        playcount := playcount + 1;
    Until (Playcount=6);

    Playcount := playcount -1;
    Writeln('You have played 5 times. Win: ', uwincount, ', Lose: ', cwincount,
            ', Draw: ',Drawcount
    );
    Readln;
    Readln;
End.
