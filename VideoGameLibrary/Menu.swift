//
//  Menu.swift
//  VideoGameLibrary
//
//  Created by Briley Barron on 9/11/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Menu{
    var shouldQuit = false//When this is true then quit the application
    
    func go(){
        //This function will handle making the menu run.  Will display the menu and take user input until the user wishes to quit the application
        
        while !shouldQuit{
            printMenu()
            print(getInput())
            quit()
            //            switch userInput{
            //            case 1:
            //                print("You chose to Add a Game")
            //            case 2:
            //                print("You chose to Remove a Game")
            //            case 3:
            //                print("You chose to List Avaliable Games")
            //            case 4:
            //                print("You chose to Check Out a Game")
            //            case 5:
            //                print("You chose to Check in a Game")
            //            case 6:
            //                print("You chose to List Checked Out Games")
            //            case 7:
            //                quit()
            //            default:
            //                print("Please select an option listed below")
            //                go()
            //            }
                   }
        }
        
        func printMenu(){
            print("""
    Please type the number for what you would like to do.
    1: Add Game
    2: Remove Game
    3: List Available Games
    4: Check Out Game
    5: Check In Game
    6: List Checked Out Games
    7: Quit
    """)
        }
        
        func quit() {
            //This will be called only when the user wants to quit
            print("You chose to Quit")
            print("Thanks for using this application")
            print("Please come again.")
            //since the user is ready to quit set shouldQuit = true
            shouldQuit = true
        }
        
        func getInput() -> String{
            //        var input: String? = nil
            //        repeat{
            //            let userInput = readLine()
            //
            //            if let unwrappedInput = userInput{
            //
            //                if input != ""{
            //                    input = unwrappedInput
            //                }
            //            }else{
            //                print("Invalid Input")
            //            }
            //
            //        }while input == nil
            //        return input!
            //    }
            //OR
            var userInput = readLine()
            
            while userInput == nil || userInput == ""{
                print("Please give a valid input")
                userInput = readLine()
            }
            return userInput!
        }
    }

