INCLUDE Irvine32.inc
includelib Winmm.lib
include macros.inc

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD


balls struct
    ighostDirection db 0
    iynewghost db 2
    icolor db 5
    iXghost db 0
    iYghost db 8
irow1done db 0
balls ends
.data
;sounds
 ;SOUNDS
    deviceConnect BYTE "DeviceConnect",0

    SND_ALIAS    DWORD 00010000h
    SND_RESOURCE DWORD 00040005h
    SND_FILENAME DWORD 00002000h
    SND_NOSTOP DWORD   00000800h
    file BYTE "zuma.wav",0
   
    gameOvertrack db "gameover.wav",0
  

;drawings
zuma_ART db ' _________  __  __           ______     ',13,10
         db '/\\_____  \/\ \/\ \  / \_/ \/\  _  \    ',13,10
         db '\/____// / \ \ \ \ \/\      \ \ \L\ \   ',13,10
         db '     // /   \ \ \ \ \ \ \__\ \ \  __ \  ',13,10
         db '    // / ___ \ \ \_\ \ \ \_/\ \ \ \/\ \ ',13,10
         db '    /\_______\\ \_____\ \_\\ \_\ \_\ \_\',13,10
         db '    \/_______/ \/_____/\/_/ \/_/\/_/\/_/ ',13,10
         db '                                         ',13,10
         db '                             made by Eman Ihsan ',13,10,13,10

               db 0                                                      
                        
               

         start    DB '                                  click 1 2 or 3                     ',13,10
                  DB '                                               ___ ___ ___ ___ ___   ',13,10
                  DB '                                              / __|_ _| . | . |_ _|  ',13,10
                  DB '                                              \__ \| ||   |   /| |   ',13,10
                  DB '                                              <___/|_||_|_|_\_\|_|   ',13,10
                  DB 0   

INSTRUCTIONS    DB '                                     _ _ _ ___ ___ ___ _ _ ___ ___ _ ___ _ _ ___ ',13,10
                DB '                                    | | \ / __|_ _| . | | |  _|_ _| | . | \ / __>',13,10
                DB '                                    | |   \__ \| ||   |   | <__| || | | |   \__ \',13,10
                DB '                                    |_|_\_<___/|_||_\_`___`___/|_||_`___|_\_<___/',13,10
                DB 0
            
EXITED           DB '                                                  _____  _ _ ___   ',13,10
                 DB '                                                 | __\ \/ | |_ _|  ',13,10
                 DB '                                                 | _> \ \ | || |   ',13,10
                 DB '                                                 |____/\_\|_||_|   ',13,10
                 DB 0
                                           
 POINTER            DB'  <<<<<<<<<<<<<<<<   ',13,10
                    DB 0

pauseScreen         db'                 $$$$$$$\  $$$$$$$$\  $$$$$$\  $$\   $$\ $$\      $$\ $$$$$$$$\ ',13,10
                    db'                 $$  __$$\ $$  _____|$$  __$$\ $$ |  $$ |$$$\    $$$ |$$  _____|',13,10
                    db'                 $$ |  $$ |$$ |      $$ /  \__|$$ |  $$ |$$$$\  $$$$ |$$ |      ',13,10
                    db'                 $$$$$$$  |$$$$$\    \$$$$$$\  $$ |  $$ |$$\$$\$$ $$ |$$$$$\    ',13,10
                    db'                 $$  __$$< $$  __|    \____$$\ $$ |  $$ |$$ \$$$  $$ |$$  __|   ',13,10
                    db'                 $$ |  $$ |$$ |      $$\   $$ |$$ |  $$ |$$ |\$  /$$ |$$ |      ',13,10
                    db'                 $$ |  $$ |$$$$$$$$\ \$$$$$$  |\$$$$$$  |$$ | \_/ $$ |$$$$$$$$\ ',13,10
                    db'                 \__|  \__|\________| \______/  \______/ \__|     \__|\________|',13,10
                    db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                                                                                ',13,10
                    db'                             $$$$$$$$\ $$\   $$\ $$$$$$\ $$$$$$$$\              ',13,10
                    db'                             $$  _____|$$ |  $$ |\_$$  _|\__$$  __|             ',13,10
                    db'                             $$ |      \$$\ $$  |  $$ |     $$ |                ',13,10
                    db'                             $$$$$\     \$$$$  /   $$ |     $$ |                ',13,10
                    db'                             $$  __|    $$  $$<    $$ |     $$ |                ',13,10
                    db'                             $$ |      $$  /\$$\   $$ |     $$ |                ',13,10
                    db'                             $$$$$$$$\ $$ /  $$ |$$$$$$\    $$ |                ',13,10
                    db'                             \________|\__|  \__|\______|   \__|                ',13,10
                    db 0

INSTRUCTIONS_SCREEN db 'Controls:                                                                                        ',13,10
                    db'                                                                                                 ',13,10
                    db' 1-Use the (w a s d) to move the shooter and aim the ball.                                          ',13,10
                    db' 2-Press the (space) bar to shoot the ball.                                                          ',13,10
                    db' 3-Match three or more balls of the same color to remove them from the chain.                       ',13,10
                    db' 4-press P for pause                                                                               ',13,10
                    db'                                                                                                 ',13,10
                    db' Gameplay:                                                                                       ',13,10
                    db'                                                                                                 ',13,10
                    db' 1-The shooter fires balls at the moving chain of balls.                                          ',13,10
                    db' 2-The balls must be matched with others of the same color in the chain to remove them.            ',13,10
                    db' 3-The chain moves closer to the goal, and you must stop it before it reaches the end.             ',13,10
                    db' 4-Special power-ups may appear                                                                    ',13,10
                    db'                                                                                                 ',13,10
                    db' Scoring:                                                                                        ',13,10
                    db'                                                                                                 ',13,10
                    db' 1-Points are awarded for each ball removed from the chain.                                        ',13,10
                    db' 2-Earning combo bonuses by clearing several balls at once increases your score.                  ',13,10
                    db' 3-Bonus points are awarded for completing a level or clearing the entire chain.                  ',13,10
                    db'                                                                                                 ',13,10
                    db' Game Over:                                                                                      ',13,10
                    db'                                                                                                 ',13,10
                    db' 1-If the chain reaches the goal, you lose a life.                                                 ',13,10
                    db' 2-Losing all lives ends the game. You start with three lives.                                      ',13,10
                    db '                             PRESS ESCAPE TO GO BACK               ',13,10
                    db 0

                               db 0
                               
 gameOverScreen   db'                    ______        ______  _______     _____  _    _ _______ ______                                    ',13,10
                  db'                   / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \                                    ',13,10
                  db'                  | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )                                   ',13,10
                  db'                  | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (                                    ',13,10
                  db'                  | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |                                   ',13,10
                  db'                   \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|                                   ',13,10
                  db 0                                            

; Player's starting position (center)
    xPos1 db 55      ; Column (X)
    yPos1 db 18      ; Row (Y)

    xDir db 0
    yDir db 0

; Default character (initial direction)
    inputChar db 0
    direction db "d"
; Counter variables for loops
    counter1 db 0
    counter2 db 0
; Interface variables
    score db 0          ; Player's score
    levelInfo db 1
    menuSelect db 1
    pauseKey db 0
    paused db 0
    strScore BYTE "Your score is: ",0
    prompt1 db "Enter your name:",0
    names db 20 dup (0)
    strName db "Name:",0

    livesString db "Lives:",0
    lives3 db "$$$",0
    lives2 db "$$",0
    lives1 db "$",0
    lives db 3
;FileHandling
scoreFile db 'scores.txt', 0

fileHandle  HANDLE ?
BUFSIZE = 5000

buffer BYTE BUFSIZE DUP(?)
bytesRead DWORD ?

;drawing spiral vriables
straightdash BYTE "|",0
dash db '-',0
space db ' ',0

xstart db 6
ystart db 6
endl db 0ah,0dh,0
underscore db '_',0


x_right db 85
x_left db 24
y_bottom db 21
y_top db 8

row1done db 0           ;bools to make the spirals work

bottomlimithit db 0

top_limit db 0
left_limit db 0
right_limit db 0
bottom_limit db 0

;multiple balls
ballexistence db 0
xghost db 0
yghost db 8
ghostdirection db 0
ynewghost db 2
drawball db 'O',0


ballsarray balls 20 dup(<>)
currball dd 0
count db 0
hash db "#",0



;fire
    fire_color db 14     ; Fire symbol color (Yellow)
    seed dw 54321
    fire_symbol db "*", 0
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic
    wkey db "W"
    qkey db "Q"
    akey db "A"
    zkey db "Z"
    ckey db "C"
    ekey db "E"
    dkey db "D"
    xkey db "X"

    ;extra vars
    temp db 0
    temp3 db 0
    x db 0
    y db 0
    Xcoordinates db 3332 dup(-1)
    Ycoordinates db 3332 dup(-1)

.code
main proc
  INVOKE PlaySound, OFFSET file, NULL, 1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SOUND UNCOMMENT PLSSSS
 ;MAIN SCREEN
    mov dl,0 
    mov dh,10
    mov eax,white
    call settextcolor
    call gotoxy
    mov edx,offset zuma_ART
    call writestring
    call waitmsg
    call clrscr

    ;NAME INPUT

    mov dh,0
    mov dl,0
    call gotoxy
    mov edx,offset prompt1
    mov ecx,lengthof prompt1
    call writestring
    
    mov edx,offset names
    mov ecx,20
    call readstring
   ; mov byte ptr [edx + ecx], 0 ;null termination

    mov edx,offset names
        mov ecx,lengthof names
        call writestring
    ;call waitmsg
    call clrscr


    ;START MENU(start,INSTRUCTIONS)

    point1:
        mov dl,70
        mov dh,3
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,1
    jmp start_tab

    point2:
        mov dl,80
        mov dh,12
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,2
    jmp start_tab

    point3:
        mov dl,70
        mov dh,22
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,3
    jmp start_tab


    start_tab:
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset START
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset INSTRUCTIONS
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset EXITED
    call writestring
    

    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
    cmp al,13
    je selection


    selection:
    cmp menuSelect,1
    je startGame
    cmp menuSelect,2
    je INSTRUCTIONSSCREEN
    cmp menuSelect,3
    je exitGame

    INSTRUCTIONSSCREEN:
    mov dl,0 
    mov dh,0
    call gotoxy
    mov edx,offset INSTRUCTIONS_SCREEN
    call writestring
    call readchar
    call clrscr
    cmp al,27
    je point2
    jmp INSTRUCTIONSSCREEN


    startGame:
    mov eax,red (blue * 16)
    ;call SetTextColor
  
    cmp paused,0
    jne skipPausing
       
       ; jmp drawingplayer
    skipPausing:


;main game loop
    call drawingspriral
  mov dh,0
    mov dl,70
    call gotoxy
    mov edx,offset hash
    movzx eax, fire_color
    call settextcolor
    mwrite "#"   
   
    gameLoop:
    
        cmp pauseKey,1
        jne skipPause
        PauseMenu:
            call clrscr
            mov dl,30
            mov dh,20
            mov edx,offset pauseScreen
            call writestring
            call readchar
            cmp al,27
            je exitGame
            cmp al,'r'
            jne PauseMenu
            call clrscr
            dec pauseKey
            jmp startGame

skipPause:

  
call moveplayer
mov esi,offset ballsarray
  ; Move each ball in a spiral path
    mov esi, offset ballsarray    ; Start of balls array
    mov ecx, 20                   ; Number of balls
multipleballs:
    
   


loop multipleballs
 
  call updateGhost
inc esi


mov ecx,20
mov ebx, offset balls

  
 ;draw lives:
        mov dl,110
        mov dh,0
        call gotoxy
        mov edx,offset livesString
        mov ecx,lengthof livesString
        call writestring
        
        mov dl,116
        mov dh,0
        call gotoxy
        movzx ecx,lives
        cmp cl,0
        je GameOver
        
        cmp al,1
        jne str2
            mov edx,offset lives1
            jmp liveSkip
        str2:
        cmp al,2
        jne str3
           mov edx,offset lives2
            jmp liveSkip
        str3:
            mov edx,offset lives3
        liveSkip:
        call writestring
        
        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
       mov edx,OFFSET strScore
        call WriteString
        movzx eax,score
        call WriteInt

        ;draw name:
        mov dl,20
        mov dh,0
        call gotoxy
        mov edx,offset strName
        mov ecx,lengthof strName
        call writestring
        mov dl,25
        mov dh,0
        call gotoxy
        mov edx,offset names
        mov ecx,lengthof names
        call writestring

        onGround:

        call readkey
        jz   gameLoop
       
        mov inputChar,al

        ;exit game
        cmp inputChar,27
        je gameover

        cmp inputChar,"p"
        jne skipPausing1
        inc pauseKey
        inc paused
        skipPausing1:
        jmp gameLoop
        gameover:
        mwrite "game over"
        invoke PlaySound, NULL, 0, SND_NOSTOP
        INVOKE PlaySound, OFFSET gameOvertrack, NULL, 1
        mov edx,offset gameoverscreen
        call writestring
fileHandling:
    mwrite "in file handle label"
    
    ; === Step 1: Open the file for reading existing data ===
    mwrite "Attempting to open file for reading"
    mov edx, OFFSET names      ; File name (address of scoreFile)
    call CreateOutputFile                  ; Open the file for reading
    mov fileHandle, eax            ; Save the file handle

    ; Check if the file opened successfully
    cmp eax, 0
    je fileOpenError               ; Jump if file handle is invalid (error)

    ; === Step 2: Read the existing data into the buffer ===
    lea edx, buffer                ; Address of the buffer
    mov ecx, BUFSIZE               ; Maximum buffer size
    call ReadFromFile              ; Read data from the file
    mov bytesRead, eax             ; Store the number of bytes read

    ; === Step 3: Close the file after reading ===
    mov eax, fileHandle            ; File handle
    call CloseFile                 ; Close the file

    ; === Step 4: Process existing data ===
    ; The buffer now contains existing file data
    ; Implement logic here to sort and organize names, scores, and level numbers
    mwrite "File data read and stored in buffer"

    ; === Step 5: Write new data to the file ===
    mwrite "Attempting to write new data to file"
    
    ; Re-open the file for writing
    mov edx, OFFSET scoreFile      ; File name (address of scoreFile)
    call CreateOutputFile                  ; Open the file for writing
    mov fileHandle, eax            ; Save the file handle
    mwrite "File handle: "
mov eax, fileHandle

    ; Check if the file opened successfully
    cmp eax, 0
    je fileOpenError               ; Jump if file handle is invalid (error)

    ; Prepare data for writing (using buffer)
    lea edx, buffer                ; Address of the buffer with new data
    mov ecx, 96                    ; Size of the new data to write (adjust as needed)
    call WriteToFile               ; Write data to the file
    mwrite "New data written to file"

    ; === Step 6: Close the file after writing ===
    mov eax, fileHandle            ; File handle
    call CloseFile                 ; Close the file
    mwrite "File handling completed successfully"
    fileOpenerror:
    mwrite "file nahi khol ri"




exitgame:
    ret
main endp

;///////////////////////////////////////OTHER FUNCTIONS/////////////////////////////////////////////
OpenFile proc
    mov ah, 3Dh
    int 21h
    ret
OpenFile endp

FireBall PROC

    mov al, direction
    mov dl, xPos1      ; Fire column starts at the player's X position
    mov dh, yPos1      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    ;mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
;mwrite "in upwards fire"
  mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh       ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
;mwrite "hm"
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh       ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh      ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh        ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh      ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
mov bl,xpos1
mov bh,ypos1
    mov fire_col, bl        ; Move fire position leftwards
    mov fire_row, bh       ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall
        cmp dl, 20            ; Left wall boundary
        jle end_fire

        cmp dl, 96            ; Right wall boundary
        jge end_fire

        cmp dh, 5             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ; Print the fire symbol at the current position

        movzx eax, fire_color    ; Move the fire color to EAX, zero-extended
        call SetTextColor   
        add dl, xDir
        add dh, yDir
        call Gotoxy
       
        
        mWrite "O"

        ; Continue moving fire in the current direction (recursive)
        mov eax, 5
        call Delay

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:
        ;mwrite "leaving fireball"
        mov dx, 0
        call GoToXY

    ret
FireBall ENDP
;////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////////////////////////////////////////////////////////////////////////////////////////////////////////
PrintPlayer PROC
    mov eax, green  
    call SetTextColor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset wkey
        jmp print

    print_down:
        mov esi, offset xkey
        jmp print

    print_left:
        mov esi, offset akey
        jmp print

    print_right:
        mov esi, offset dkey
        jmp print

    print_upleft:
        mov esi, offset qkey
        jmp print

    print_upright:
        mov esi, offset ekey
        jmp print

    print_downleft:
        mov esi, offset zkey
        jmp print

    print_downright:
        mov esi, offset ckey
        jmp print

    print:
    mov dl, xpos1             ;x
    mov dh, ypos1           ;y
    call GoToXY

    call writechar
    
ret
PrintPlayer ENDP
;/////////////////////////////////////////////////////////////////////////////////////////////
MovePlayer PROC
    mov eax, 30             
    call Delay;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;change this delay

    mov eax, 0              ; Prepare to read a key
    call Readkey
    mov inputChar, al       ; Store the input character

    ; Handle specific keys
    cmp inputChar, VK_SPACE ; Check if SPACE key is pressed
    je shoot

    cmp inputChar, 'p'      ; Check if 'p' key is pressed
    je paused2

    ; Check for movement keys
    cmp inputChar, "w"
    je move
    cmp inputChar, "a"
    je move
    cmp inputChar, "x"
    je move
    cmp inputChar, "d"
    je move
    cmp inputChar, "q"
    je move
    cmp inputChar, "e"
    je move
    cmp inputChar, "z"
    je move
    cmp inputChar, "c"
    je move

    ; If no valid input, simply return
    ret

move:
    mov al, inputChar       ; Update the direction variable
    mov direction, al
    jmp chosen              ; Proceed to handle the movement

paused2:
    call clrscr             ; Clear the screen
    mov edx, offset pausescreen
    call writestring        ; Display pause message
    ret                     ; Return after pausing

shoot:
    ;mwrite "call fireball"  ; Debug message
    
   mov dh,0
    mov dl,70
    call gotoxy
    mov edx,offset hash
    call randomcolor

    mov fire_color, al       ; Store the random color
    and fire_color, 0Fh      ; Clear the background color (high nibble)
    movzx eax, fire_color
    call settextcolor
    mwrite "#"   
    call FireBall           ; Handle shooting
    
    jmp chosen              ; Continue after shooting

chosen:
    call PrintPlayer        ; Draw the player in the current direction
    ret                     ; Return from the procedure
MovePlayer ENDP
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
updateghost proc
cmp ballexistence,1
je skipghost
mov cl,xghost        
mov ch, Yghost       
mov x, cl            ;x in ch
mov y, ch            ;y in cl


cmp row1done,1
je skipping


; RIGHT LIMIT X
cmp Xghost, 85          ; Compare Xghost with 44 (right limit for X position)
jne s1                  ; If Xghost is not 44, jump to s1 (skip the next part)
jb s1

; starting position of y maintain
cmp Yghost, 8           ; Compare Yghost with 6 (top boundary for Y position)
jne s2                  ; If Yghost is not 6, jump to s2 (skip the next part)
mov ghostdirection,1            ; Increment the ghost's direction if both X = 44 and Y = 6
;mov row1done,1
s2:
; Bottom limit
cmp Yghost, 21       ; Compare Yghost with 25 (bottom boundary for Y position)
jne s1           ; Increment the ghost's direction if Y = 25 (bottom boundary)
mov ghostdirection,2  
;mov row1done,1
s1:
; Check if Xghost is equal to 24 (left limit for X position)
cmp Xghost, 24          ; Compare Xghost with 24 (left boundary for X position)

jne s3                  ; If Xghost is not 24, jump to s3 (skip the next part)
mov ghostdirection,3
;mov row1done,1
; Check if Yghost is equal to 25 (bottom limit for Y position)
cmp Yghost, 21          ; Compare Yghost with 25 (bottom boundary for Y position)
jne s4                  ; If Yghost is not 25, jump to s4 (skip the next part)
mov ghostdirection,3       ; Increment the ghost's direction if both X = 24 and Y = 25
mov row1done,1
s4:
; Check if Yghost is equal to 6 (top limit for Y position)
cmp Yghost, 8           ; Compare Yghost with 6 (top boundary for Y position)
jne s3                  ; If Yghost is not 6, jump to s3 (skip the next part)

; Reset the ghost direction to 0 when it reaches the top Y limit
mov ghostDirection, 0   ; Set the direction to 0 when both X = 24 and Y = 6 (top left corner)

jmp newskip





skipping:
cmp Xghost, 65          ; Compare Xghost with 44 (right limit for X position)
jne s12                  ; If Xghost is not 44, jump to s1 (skip the next part)



; starting position of y maintain
cmp Ynewghost, 2           ;RIGHT LIMIT
jne s22                  ; If Yghost is not 6, jump to s2 (skip the next part)
mov ghostdirection,1            ; Increment the ghost's direction if both X = 44 and Y = 6

s22:
; Bottom limit
cmp Ynewghost, 10       ; Compare Yghost with 25 (bottom boundary for Y position)
jb s12           ; Increment the ghost's direction if Y = 25 (bottom boundary)
jne s12           ; Increment the ghost's direction if Y = 25 (bottom boundary)

mov ghostdirection,2
mov bottomlimithit,1
jmp bottomlimithitlable


s12:
; Check if Xghost is equal to 24 (left limit for X position)
cmp Xghost, 24          ; Compare Xghost with 24 (left boundary for X position)

jne s3                 ; If Xghost is not 24, jump to s3 (skip the next part)
mov ghostdirection,3

; Check if Yghost is equal to 25 (bottom limit for Y position)
cmp Yghost, 21          ; Compare Yghost with 25 (bottom boundary for Y position)
jne s42                  ; If Yghost is not 25, jump to s4 (skip the next part)
mov ghostdirection,3       ; Increment the ghost's direction if both X = 24 and Y = 25

s42:
; Check if Yghost is equal to 6 (top limit for Y position)
cmp Yghost, 8           ; Compare Yghost with 6 (top boundary for Y position)
jne s3                  ; If Yghost is not 6, jump to s3 (skip the next part)

; Reset the ghost direction to 0 when it reaches the top Y limit
mov ghostDirection, 0   ; Set the direction to 0 when both X = 24 and Y = 6 (top left corner)

newskip:
s3:

; Now update the position based on the ghostDirection
; If ghostDirection = 0, move right (increment X)
cmp ghostDirection, 0   ; Compare ghostDirection with 0
jne a1                  ; If it's not 0, jump to a1 (skip the next part)
inc Xghost              ; Increment Xghost to move the ghost to the right
a1:

; If ghostDirection = 1, move down (increment Y)
cmp ghostDirection, 1   ; Compare ghostDirection with 1
jne a2                  ; If it's not 1, jump to a2 (skip the next part)
inc Yghost              ; Increment Yghost to move the ghost down
inc Ynewghost              ; Increment Yghost to move the ghost down
a2:
; If ghostDirection = 2, move left (decrement X)
cmp ghostDirection, 2   ; Compare ghostDirection with 2
jne a3                  ; If it's not 2, jump to a3 (skip the next part)
dec Xghost              ; Decrement Xghost to move the ghost to the left
a3:

; If ghostDirection = 3, move up (decrement Y)
cmp ghostDirection, 3   ; Compare ghostDirection with 3

jne a4                  ; If it's not 3, jump to a4 (skip the next part)
dec Yghost              ; Decrement Yghost to move the ghost up
dec Ynewghost              ; Decrement Yghost to move the ghost up
a4:

;mov eax, red + (blue SHL 4) 
    ;call SetTextColor
; Call a delay function to slow down the ghost's movement
mov eax, 8             ; Load the delay duration (18) into EAX register
;call delay              ; Call the delay function//////////////////////////////////////delayyyyyyyyyyyyyyyyyy
;call delay;(speed reasons)              ; Call the delay function

; Move the cursor to the new position of the ghost (Xghost, Yghost)
mov eax,white (blue * 16) ; white on blue
call SetTextColor
mov dl, Xghost          ; Load Xghost into DL (used by gotoxy)
mov dh, Yghost          ; Load Yghost into DH (used by gotoxy)
mov al, drawball           ; Load the ghost's character ('O') into AL
call gotoxy             ; Call gotoxy to position the cursor at (Xghost, Yghost)
call writechar          ; Call writechar to print the ghost character ('O')

; Prepare for the next step of displaying the updated ghost position
mov dl, cl              ; Move the original Xghost value back into DL
mov dh, ch              ; Move the original Yghost value back into DH
dec ch                  ; Decrease Yghost (top to bottom on the screen)
dec cl                  ; Decrease Xghost (left to right on the screen)
mov temp3, ch           ; Store the new Y position (after decrement) into temp3

; Display the character at the calculated position
mov dl, x               ; Load the current X position into DL
sub ecx, 118            ; Adjust ECX back to the base of the coordinate system
add edi, ecx            ; Update the Y coordinate address (EDI)
mov dh, y               ; Load the Y position into DH
call gotoxy             ; Move the cursor to the new coordinates
mov eax, brown          ; Load the color code for green into EAX
call settextcolor       ; Call the function to set the text color to green

; Compare the memory content at the calculated position to see if it's an obstacle or empty space
mov al, -1              ; Load AL with the value -1 (used to check empty space)
cmp [esi], al           ; Compare the content at the calculated position to -1
jne point               ; If it's not -1 (empty), jump to point (to print a dot)

; If the position is empty, display a space
mov al, 32              ; Load AL with a space character
jmp noPoint             ; Jump to noPoint to finish this part

point:
; If it's not empty, display a dot to represent the ghost
;mov al, '.'             ; Load AL with a dot character (representing the ghost)

noPoint:
; Display the final character at the calculated position
call writechar          ; Write the character at the position calculated above

cmp bottomlimithit,1
jne skipghost

bottomlimithitlable:
    dec lives
;proc for moving balls back 
    mov    bottomlimithit,0
    mov ballexistence,1
    jmp eraseball
eraseball:
    mov dl,xghost
    mov dh,yghost
    call gotoxy
    mov al," "
    call writechar
eraselives:
        
        mov dl,116
        mov dh,0
        call gotoxy
        movzx ecx,lives
        cmp cl,0
        je GameOver
        
        cmp al,1
        jne str2
            mov edx,offset lives1
            jmp liveSkip
        str2:
        cmp al,2
        jne str3
           mov edx,offset lives2
            jmp liveSkip
        str3:
            mov edx,offset lives3
        liveSkip:
        call writestring
    gameover:
    call clrscr
    mov edx,offset gameoverscreen
    call writestring


skipghost:
    ret

    

   

updateghost endp
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
generaterandom proc
    ; Very simple random number generator using seed
    mov ax, seed          ; Load the seed
    add ax, 13            ; Increment seed by a constant
    xor ax, 1234h         ; XOR with another constant
    mov seed, ax          ; Save the updated seed
    ret
generaterandom endp

randomcolor proc
    ; Generate random values for red, green, and blue (0-15 each)
    call generaterandom   ; Random number for red
    and al, 0Fh           ; Ensure value is 0-15
    mov ah, al            ; Store red in AH

    call generaterandom   ; Random number for green
    and al, 0Fh           ; Ensure value is 0-15
    shl al, 4             ; Shift left to make space for blue
    or ah, al             ; Combine green with red

    call generaterandom   ; Random number for blue
    and al, 0Fh           ; Ensure value is 0-15
    or ah, al             ; Combine blue with red+green

    mov al, ah            ; Move final color into AL
    ret
randomcolor endp

drawingspriral proc

  mov eax, cyan + (blue SHL 4) 
   ; call SetTextColor
    
   mov dh,ystart
   mov dl,xstart
   call gotoxy
   mov edx, offset straightdash
   call writestring     ;first dash
   
  
   mov ecx,80            ;frist line
   horizontalloop:
       mov edx, offset dash
       call writestring
   loop horizontalloop

   mov edx, offset straightdash
   call writestring

   ;second line
   inc ystart
   mov dl,xstart
   mov dh,ystart
   call gotoxy
   mov edx, offset straightdash
   call writestring 

   mov ecx,80
   spaceloop:
            mov edx,offset space                         ;loop for spaces
            call writestring  
   loop spaceloop
   mov edx, offset straightdash
   call writestring

   ;third line
    inc ystart
   mov dl,xstart
   mov dh,ystart
   call gotoxy
    mov edx, offset straightdash
   call writestring 

   mov ecx,80
   spaceloop2:
            mov edx,offset space 
            call writestring  
   loop spaceloop2
   mov edx, offset straightdash
   call writestring

   ;fourth line
    inc ystart
   mov dl,xstart
   mov dh,ystart
   call gotoxy
    
   mov edx, offset straightdash
   call writestring 
   mov ecx,75
   horizontalloop2:
       mov edx, offset dash
       call writestring
   loop horizontalloop2
    mov edx, offset straightdash
   call writestring
   mov ecx,4
   loopfrospace:
        mov edx, offset space
        call writestring
   loop loopfrospace
   mov edx, offset straightdash
   call writestring 

   ;fifth line
   inc ystart
  
  add xstart,76
  mov dl,xstart
  mov dh,ystart
  call gotoxy
  mov edx, offset straightdash
   call writestring
  inc ystart
  add xstart,76
  mov dl,xstart
  mov dh,ystart
  call gotoxy
  mov edx, offset straightdash
   mov ecx,4
   loopfrospace2:
        mov edx, offset space
        call writestring
   loop loopfrospace2
   mov edx, offset straightdash
   call writestring 
   ;next line
   mov edx,offset endl
   call writestring
   mov ecx,82
   someloop:
    mov edx,offset space
    call writestring

   loop someloop
    inc ystart
  
  add xstart,76
  mov dl,xstart
  mov dh,ystart
  call gotoxy
  mov edx, offset straightdash
   call writestring

  mov edx, offset straightdash
   mov ecx,4
   loopfrospace233:
        mov edx, offset space
        call writestring
   loop loopfrospace233
   mov edx, offset straightdash
   call writestring 
   ;sixth line
   mov edx,offset endl
   call writestring
   
   mov ecx,21
   spaceloop3:
   mov edx,offset space
   call writestring
   loop spaceloop3
         
mov edx, offset straightdash
call writestring       
mov ecx, 50             
   loopr2:
            mov edx,offset dash
            call writestring
   loop loopr2
    mov edx, offset straightdash
   call writestring 
    mov ecx,9
   loopfrospace3:
        mov edx, offset space
        call writestring
   loop loopfrospace3
   mov edx, offset straightdash
   call writestring 
   mov ecx,4
   againloop:
        mov edx,offset space
        call writestring
   loop againloop
   mov edx,offset straightdash
   call writestring

  
   
   ;7 line
   mov edx,offset endl
   call writestring
   mov ecx,21
   spaceloop9:
   mov edx,offset space
   call writestring
   loop spaceloop9
    
   
   mov edx, offset straightdash
   call writestring 

   mov ecx,40
   spaceloop4:
            mov edx,offset space                         ;loop for spaces
            call writestring  
   loop spaceloop4
   mov edx, offset space
   call writestring
   mov ecx,9
   loopfrospace1:
        mov edx, offset space
        call writestring
   loop loopfrospace1
    mov edx,offset straightdash
   call writestring
   mov ecx,4
   againloop5:
        mov edx,offset space
        call writestring
   loop againloop5
   mov edx,offset space
   call writestring

   mov ecx,4
   againloop25:
        mov edx,offset space
        call writestring
   loop againloop25
    mov edx,offset straightdash
   call writestring
   mov ecx,4
   againloop253:
        mov edx,offset space
        call writestring
   loop againloop253
    mov edx,offset straightdash
   call writestring
   ;8 line
    mov edx,offset endl
   call writestring
   mov ecx,21
   spaceloop92:
   mov edx,offset space
   call writestring
   loop spaceloop92
    
   
   mov edx, offset straightdash
   call writestring 

   mov ecx,40
   spaceloop42:
            mov edx,offset space                         ;loop for spaces
            call writestring  
   loop spaceloop42
   mov edx, offset space
   call writestring
   mov ecx,9
   loopfrospace12:
        mov edx, offset space
        call writestring
   loop loopfrospace12
    mov edx,offset straightdash
   call writestring

   mov ecx,4
   againloop3:
        mov edx,offset space
        call writestring
   loop againloop3
   mov edx,offset space
   call writestring

   mov ecx,4
   againloop23:
        mov edx,offset space
        call writestring
   loop againloop23
    mov edx,offset straightdash
   call writestring
    mov ecx,4
   againloop231:
        mov edx,offset space
        call writestring
   loop againloop231
    mov edx,offset straightdash
   call writestring
   ;9 line
    mov edx,offset endl
   call writestring
   mov ecx,21
   sloop:
   mov edx,offset space
   call writestring
   loop sloop

    
   mov edx, offset straightdash
   call writestring 
   mov ecx,10
   sloop1:
   mov edx,offset space
   call writestring
   loop sloop1
   mov ecx,31
   horizontalloop22:
       mov edx, offset dash
       call writestring
   loop horizontalloop22

   
    mov edx, offset straightdash
   call writestring
   mov ecx,8
   loopfrospace22:
        mov edx, offset space
        call writestring
   loop loopfrospace22
   mov edx, offset straightdash
   call writestring 


   mov ecx,4
   againloop1:
        mov edx,offset space
        call writestring
   loop againloop1
   mov edx,offset space
   call writestring

   mov ecx,4
   againloop21:
        mov edx,offset space
        call writestring
   loop againloop21

   mov edx,offset straightdash
   call writestring

    mov ecx,4
   againloopp:
        mov edx,offset space
        call writestring
   loop againloopp

   mov edx,offset straightdash
   call writestring

   ;next line
  mov edx,offset endl
  call writestring

  mov ecx , 21
  myloop:
  mov edx,offset space
  call writestring
  loop myloop

   mov edx,offset straightdash
  call writestring

  mov ecx , 9
  myloop1:
  mov edx,offset space
  call writestring
  loop myloop1
  mov edx,offset straightdash
  call writestring
  mov ecx , 31
  myloop2:
  mov edx,offset space
  call writestring
  loop myloop2
  mov edx,offset straightdash
  call writestring

  mov ecx , 8
  myloop3:
  mov edx,offset space
  call writestring
  loop myloop3
  mov edx,offset straightdash
  call writestring
  mov ecx , 4
  myloop4:
  mov edx,offset space
  call writestring
  loop myloop4
  mov edx,offset space
  call writestring

  mov ecx , 4
  myloop5:
  mov edx,offset space
  call writestring
  loop myloop5
  mov edx,offset straightdash
  call writestring

  mov ecx , 4
  myloop6:
  mov edx,offset space
  call writestring
  loop myloop6
  mov edx,offset straightdash
  call writestring



   ;next line
   mov edx,offset endl
  call writestring

  mov ecx , 21
  m:
  mov edx,offset space
  call writestring
  loop m

   mov edx,offset straightdash
  call writestring

  mov ecx , 9
  my:
  mov edx,offset space
  call writestring
  loop my
  mov edx,offset straightdash
  call writestring
  mov ecx , 31
  myl:
  mov edx,offset space
  call writestring
  loop myl
  mov edx,offset straightdash
  call writestring

  mov ecx , 8
  mylo:
  mov edx,offset dash
  call writestring
  loop mylo
  mov edx,offset straightdash
  call writestring
  mov ecx , 4
  myloo:
  mov edx,offset space
  call writestring
  loop myloo
  mov edx,offset space
  call writestring

  mov ecx , 4
  myloopp:
  mov edx,offset space
  call writestring
  loop myloopp
  mov edx,offset straightdash
  call writestring

  mov ecx , 4
  myloopppp:
  mov edx,offset space
  call writestring
  loop myloopppp
  mov edx,offset straightdash
  call writestring
  ;next line
    mov edx, offset endl
  call writestring

  
  mov ecx, 21
print_line1_spaces:
  mov edx, offset space
  call writestring
  loop print_line1_spaces

  mov edx, offset straightdash
  call writestring

  
  mov ecx, 9
print_line2_spaces:
  mov edx, offset space
  call writestring
  loop print_line2_spaces

  mov edx, offset straightdash
  call writestring

  
  mov ecx, 45
print_line3_underscores:
  mov edx, offset space
  call writestring
  loop print_line3_underscores

  mov edx, offset space
  call writestring

  
  mov ecx, 4
print_line4_spaces:
  mov edx, offset space
  call writestring
  loop print_line4_spaces

  mov edx, offset straightdash
  call writestring

  
  mov ecx, 4
print_line5_spaces:
  mov edx, offset space
  call writestring
  loop print_line5_spaces

  mov edx, offset straightdash
  call writestring
  ;next line
    mov edx, offset endl
  call writestring

  ; Print 21 spaces for the first line
  mov ecx, 21
draw_initial_spaces:
  mov edx, offset space
  call writestring
  loop draw_initial_spaces

  mov edx, offset straightdash
  call writestring

  ; Print 9 spaces for the second line
  mov ecx, 9
draw_second_line_spaces:
  mov edx, offset space
  call writestring
  loop draw_second_line_spaces

  mov edx, offset straightdash
  call writestring

  ; Print 45 spaces for the third line
  mov ecx, 45
draw_third_line_spaces:
  mov edx, offset space
  call writestring
  loop draw_third_line_spaces

  mov edx, offset space
  call writestring

  ; Print 4 spaces for the fourth line
  mov ecx, 4
draw_fourth_line_spaces:
  mov edx, offset space
  call writestring
  loop draw_fourth_line_spaces

  mov edx, offset straightdash
  call writestring

  ; Print 4 spaces for the fifth line
  mov ecx, 4
draw_fifth_line_spaces:
  mov edx, offset space
  call writestring
  loop draw_fifth_line_spaces

  mov edx, offset straightdash
  call writestring

  ;next line
  mov edx, offset endl
  call writestring


  
  mov ecx, 21
print_initial_spaces:
  mov edx, offset space
  call writestring
  loop print_initial_spaces

  mov edx, offset straightdash
  call writestring

 
  mov ecx, 9
print_section1_spaces:
  mov edx, offset space
  call writestring
  loop print_section1_spaces

  mov edx, offset straightdash
  call writestring

  
  mov ecx, 50
print_section2_spaces:
  mov edx, offset underscore
  call writestring
  loop print_section2_spaces

  
  mov edx, offset straightdash
  call writestring

  mov ecx, 4
print_section6_spaces:
  mov edx, offset space
  call writestring
  loop print_section6_spaces

  mov edx, offset straightdash
  call writestring

  mov ecx, 4
print_section6_spaces1:
  mov edx, offset space
  call writestring
  loop print_section6_spaces1

 
  ;next line
    mov edx, offset endl
  call writestring

 
  mov ecx, 21
loop_spaces_1:
  mov edx, offset space
  call writestring
  loop loop_spaces_1

  mov edx, offset straightdash
  call writestring

  
  mov ecx, 9
loop_spaces_2:
  mov edx, offset space
  call writestring
  loop loop_spaces_2

  mov edx, offset space
  call writestring

  mov ecx, 45
loop_underscores_3:
  mov edx, offset space
  call writestring
  loop loop_underscores_3

  mov edx, offset space
  call writestring

  mov ecx, 4
loop_spaces_4:
  mov edx, offset space
  call writestring
  loop loop_spaces_4

  mov edx, offset space
  call writestring

  
  mov ecx, 4
loop_spaces_5:
  mov edx, offset space
  call writestring
  loop loop_spaces_5

  mov edx, offset straightdash
  call writestring

  ;next line
    mov edx, offset endl
  call writestring
  mov ecx, 21
loop_start_spaces:
  mov edx, offset space
  call writestring
  loop loop_start_spaces

  mov edx, offset straightdash
  call writestring
  mov ecx, 9
loop_middle_spaces:
  mov edx, offset space
  call writestring
  loop loop_middle_spaces

  mov edx, offset space
  call writestring

  mov ecx, 45
loop_underscore_section:
  mov edx, offset space
  call writestring
  loop loop_underscore_section

  mov edx, offset space
  call writestring
  mov ecx, 4
loop_end_spaces1:
  mov edx, offset space
  call writestring
  loop loop_end_spaces1

  mov edx, offset space
  call writestring
  mov ecx, 4
loop_end_spaces2:
  mov edx, offset space
  call writestring
  loop loop_end_spaces2

  mov edx, offset straightdash
  call writestring

  ;next line
  
    mov edx, offset endl
  call writestring
  mov ecx, 21
loop_start_spaces4:
  mov edx, offset space
  call writestring
  loop loop_start_spaces4
  mov edx,offset straightdash
  call writestring
  mov ecx,65
  llloopp:
  mov edx,offset dash
  call writestring
  loop llloopp
  mov edx,offset straightdash
  call writestring
	ret 

drawingspriral endp

END main
final.asm
Displaying final.asm.
