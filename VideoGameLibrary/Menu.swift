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
    var library = Library()
    func go(){
        //This function will handle making the menu run.  Will display the menu and take user input until the user wishes to quit the application
        
        while !shouldQuit{
            printMenu()
            let input = getInput()
            handleInput(input: input)
        }
    }
    
    func printMenu(){//gives otions for the switch function below.
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
    
    func handleInput(input: String){//determines the function to be used
        switch input{
        case "1":
            //call add game function
            print("You chose to Add a Game")
            library.addGame()
        case "2":
            //call remove game function
            print("You chose to Remove a Game")
            library.removeGame()
        case "3":
            //call list avaliable
            print("You chose to List Avaliable Games")
            library.listAvaliableGames()
        case "4":
            //call check out game
            print("You chose to Check Out a Game")
            library.checkOutGame()
        case "5":
            //call check in game
            print("You chose to Check in a Game")
            library.checkInGame()
        case "6":
            //call list checked out games
            print("You chose to List Checked Out Games")
            library.listCheckedOutGames()
        case "7":
            quit()
        default:
            print("Please select an option listed below")
            go()
        }
    }
    
    func getInput() -> String{//takes in input
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
        
        while Int(userInput!) == nil || userInput == "" || Int(userInput!)! > 8{//ensures the user input is valid
            print("Please give a valid input")
            printMenu()
            userInput = readLine()
        }
        return userInput! //then returns it
    }
}

