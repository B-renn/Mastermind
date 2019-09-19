### Instructions
1. Execute ruby mastermind.rb in the terminal to start the game
2. Game will ask for players name
3. The computer will generate 4 random colors, and it is your job to guess them in the correct order. There are 8 possible colors to choose from    (RGBPOBW).
4. The program will prompt you to enter your guess. Enter 4 colors separated by commas --example-->  red,blue,green,orange
5. The program will return hints on how good your guess was. It will tell you how many colors and positions you have guessed correctly.
6. You have 12 attempts to guess the correct colors in the correct order ! Note: the computer can pick the same color more than once               --example-->  red,red,green,orange
### Error proofing
1. If you don't enter 4 colors, you will get an error and be prompted to re-enter your guess --example-->  white,black,purple
2. If you don't enter an allowable color or have a typo, you will get an error and be prompted to re-enter your guess 
    --example-->  white,blue,pink,green  OR  white,white,blu,red
### Bugs
1. The program returns the same feedback twice for one guess input. It does not have a negative effect on the game, and the feedback the program    provides is correct but just prints twice -- will fix later 