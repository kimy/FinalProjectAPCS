FinalProjectAPCS
================
By: 
Yubin Kim 
Tony Li

Farmville On Processing

Project Description: 

Overview:
This project is to create a simpler version of the facebook game, Farmville, using processing. 

Project Features: 
This project will be able to: 
-On mouseclick, be able to detect what is there and the options availible for it. 
For example: If it is empty space then it would tell the player the availible options which is plowing the land. 

-It will have store where the user would be able to buy seeds, trees, animals, and other materials to make their farming experience better.

-The currenncy: Gold
Gold can be obtained by harvesting crops or eggs for chickens and selling them at a marketplace.

-This will also have a time system, so that the user would be able to see the growth of the crops overtime. However, if they don't harvest them quick enough, the crops will wither. 

JANUARY 5th 2015
-Project Planning.
We weren't very sure about what to do with the project, so mostly we planned on paper of what features we wanted to include and implement =. 

JANUARY 6TH 2015
-Finding the images
We spent our time looking and researching different methods and images we can use for the game. We spent time looking at processing documentation and learning some of the methods availible. 

JANUARY 7TH 2015
-Continued January 6th's Work
-Importing Images
We collected a folder of pictures that we would be able to use for the project. 
JANUARY 8TH 2015
-Resizing Images
We worked on learning how to resize all the pictures at once into a certain size (75 x 75 pixels)
-Testing Code
We worked on bits of code, trying to find the right methods and styles of codes we needed for the game.

JANUARY 9TH 2015
-Started Official Project Code
Although it was a slow start...

JANUARY 10TH 2015
-creating quadrilaterals for plot or spaces

JANUARY 11TH 2015
-Hover Select: A method that is looped in draw() where each grid space is lit up. 
-BasicPlot class: We need this class to implement specific properties for each plot.

JANUARY 12TH 2015
We had a bug where the plot would not stick on the board. 

JANUARY 13TH 2015
-Worked on the Seed Class
-Figured out the Time implementation

JANUARY 14TH 2015
-Continued debugging the basics of our program 

JANUARY 15TH 2015
-Discovered major flaw in indices of farm[]. 
-Attempted to fix

JANUARY 16TH 2015
-Worked on grow fxn.
-completed "first draft" of seed class
-Working "plow"

JANUARY 17TH 2015
-Successfully implemented plow and plant methods
-Figured out basic algorithm for grow

JANUARY 18TH 2015
-Created the shop with a variety of fxns
-Created "buttons" to access and exit the shop
-Now able to plant different seeds
-Partially working grow fxn.

JANUARY 19TH 2015
-made "My Harvest" part
-fully working grow fxn
-when harvest, player profits
-added money, exp

JANUARY 20TH 2015
-upgraded hoverSelect
-implemented withered plants
-reworked buy fxn for testing efficiency as well as lowering player frustration
-added grapes and pumpkins
-fixed sellAll button

<<<<<<<<<<<IMPORTANT NOTE>>>>>>>>>>>>>>

An inconsistent bug occurs every now and then in which the seeds will suddenly
cease to grow. There was no noticeable pattern of the bug and an error did not
pop up, so it is almost impossible to find.


;-----------------------
Methods:
plow: on mouse click a basicplot appears on the screen

