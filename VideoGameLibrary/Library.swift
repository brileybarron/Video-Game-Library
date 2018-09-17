//
//  Library.swift
//  VideoGameLibrary
//
//  Created by Briley Barron on 9/13/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Library{
    var gameArray = [Game(title: "Super Smash Bros.", ESRB: .E10Up), Game(title: "The Elder Scrolls V: Skyrim", ESRB: .M), Game(title: "Thomas Was Alone", ESRB: .E), Game(title: "Minecraft", ESRB: .E10Up)]//this gives an initial value for any library created.
    //----------------------------------------------------------------------------------------------
    func addGame() {
        print("What is the title of the game you are wanting to add?")//askes the user a question
        let userGameName = readLine()//takes the answer.  There is really no way to check and see if it is an actual game
        var goodRating = false // this will be used to ensure that the rating used is an eligible rating
        var rating = ESRBRating.NR //this gives a default value in case something goes wrong
        repeat{
            printMenu(userGameName: userGameName!) //calls the function created earlier to print the different options
            var userRating = readLine()//takes user input
            var ratingInt: Int
            while rating == .NR{
                if Int(userRating!) != nil {//as long as the integer version of userRating isn't nil then
                    ratingInt = Int(userRating!)!//set that value to another variable
                    if Array(1...7).contains(ratingInt){//then check to see if that variable is within a number array
                        rating = userRatingSwitch(ratingInt: ratingInt)//
                        goodRating = true//allows us to get out of the repeat loop
                    }else{
                        print("You have entered an invalid option please try again:")//Tell them they have entered something wrong and take the input again
                        printMenu(userGameName: userGameName!)
                        userRating = readLine()
                        rating = .NR//if the value isn't contained then continue to use the while loop
                    }
                }else{
                    print("You have entered an invalid option please try again:")//Tell them they have entered something wrong and take the input again
                    printMenu(userGameName: userGameName!)
                    userRating = readLine()
                    rating = .NR//continue in the while
                }
            }
            let newGame = Game(title: userGameName!, ESRB: rating)
            gameArray.append(newGame)
        } while !goodRating //This continues to run until the goodRating equals true
    }
    //----------------------------------------------------------------------------------------------
    func userRatingSwitch(ratingInt: Int) -> ESRBRating{
        if ratingInt < 8 && ratingInt > 0{
            switch ratingInt {//use the switch to determine what the ESRBRating will be for the game created.
            case 1:
                return .EC
            case 2:
                return .E
            case 3:
                return .E10Up
            case 4:
                return .T
            case 5:
                return .M
            case 6:
                return .AO
            case 7:
                return .RP
            default:
                return .NR//shouldn't ever run this
            }
        }else{
            print("please try again")//something went wron
            return userRatingSwitch(ratingInt: ratingInt)
        }
    }
    //----------------------------------------------------------------------------------------------
    func listAvaliableGames (){
        var counter = 0
        for games in gameArray{//for every game in the gameArray
            if games.checkedIn{//check to see if it is checked in
                counter += 1 //counter adds one to list the games
                print("\(counter): Title: \(games.title) \n ESRB Rating: \(games.ESRB)") //this is how I want each game to be listed out
            }
        }
    }
    
    //----------------------------------------------------------------------------------------------
    func removeGame() {
        for index in 1...gameArray.count{//this gives the list of every game in the library
            print("\(index): \(gameArray[index - 1].title)")
        }
        print("Please enter the number for the game you wish to remove:")
        
        var userInput = Int(readLine()!)//takes user input
        let validGameIndex = Array(0..<gameArray.count)//creates an array from 0 to one less than the amount of items in the array
        
        while userInput == nil || !validGameIndex.contains(userInput! - 1){//if the user's input is nil or if the validGameIndex contains the user value minus 1 then have them repeat the process.
            print("Invalid response. Please enter a useable index")
            userInput = Int(readLine()!)
        }
        
        gameArray.remove(at: userInput! - 1)//if everything is approved then remove the game at the user's index minus 1 because arrays start at 0
    }
    //----------------------------------------------------------------------------------------------
    func checkOutGame() {
        func listGames(){// create a function inside a function because this is the only place it will be used.  the scope of the function is just inside the function.
            for index in 1...gameArray.count {//loops through each ggame and determines if the games checked in value is true.
                if gameArray[index - 1].checkedIn == true {
                    print("\(index): \(gameArray[index - 1].title)")//if it is the put it in the list.
                }
            }
        }
        listGames()//call the function above
        print("Please enter the index of the game you wish to check out:")
        var userInput = Int(readLine()!)//takes user input for the question above.
        
        while userInput == nil || userInput! > gameArray.count || userInput! <= 0 || gameArray[userInput! - 1].checkedIn == false{//this will validate that the user's input is valid.  if it isn't then this loop is ran until it is.
            print("Invalid input. Please enter a valid index.")
            listGames()
            userInput = Int(readLine()!)
        }
        gameArray[userInput! - 1].checkedIn = false//this changes the game's checked in value to false.  This is important for other functions
        let calendar = Calendar.current//creating a calendar
        
        let dueDate = calendar.date(byAdding: .day, value: 14, to: Date())//gives the user 14 days to return the game
        
        gameArray[userInput! - 1].dueDate = dueDate//gives a value for the optional due date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"//formats the way a date is organized
        
        print("\(gameArray[userInput!-1].title) is due on \(dateFormatter.string(from: dueDate!))") //gives the user a notice on when the game is due back
    }
    //----------------------------------------------------------------------------------------------
    func printMenu(userGameName: String){//just prints out the options for the ESRBRating
        print("""
            What is the rating of \(userGameName)
            1:  EC      (Early Childhood)
            2:  E       (Everyone)
            3:  E 10+   (Everyone 10 and Up)
            4:  T       (Teens)
            5:  M       (Mature)
            6:  AO      (Adults Only)
            7:  RP      (Rating Pending)
            """)
    }
    //----------------------------------------------------------------------------------------------
    func checkInGame() {
        var userInputInt: Int
        var gamesThatAreNotCheckedIn = [Game]()//does the smae thing as the function below
        for games in gameArray{
            if !games.checkedIn {
                gamesThatAreNotCheckedIn.append(games)
            }
        }
        func listGames() {
            var counter = 0
            for games in gamesThatAreNotCheckedIn{
                counter += 1
                print("\(counter): \(games.title)")
            }
        }
        listGames()//until here
        var keepGoing = false
        
        repeat{
            if gamesThatAreNotCheckedIn.count == 0 {//this is when the program determines if there are any games checked in or not.
                print("No games are currently checked out.")//if no games are checked out then do this
                keepGoing = true //this allows it to break out of the loop
            }else{
                print("Please enter the number of the game you want to check in:")//if there are games checked out then take user input on the game they want to check out.
                var userInput = readLine()
                
                while Int(userInput!) == nil || Int(userInput!)! > gamesThatAreNotCheckedIn.count || Int(userInput!)! <= 0{//as long as a valid input is given then this should not run.
                    print("You have entered an invalid response")
                    listGames()
                    print("please try again")
                    userInput = readLine()
                }
                
                userInputInt = Int(userInput!)!
                gamesThatAreNotCheckedIn[userInputInt - 1].dueDate = nil
                gamesThatAreNotCheckedIn[userInputInt - 1].checkedIn = true
                keepGoing = true
                
            }
        }while keepGoing == false
    }
    //----------------------------------------------------------------------------------------------
    func listCheckedOutGames(){
        var gamesThatAreNotCheckedIn = [Game]()//creates an array this will be used to store all games that aren't checked in
        var counter = 0
        for games in gameArray{//loops through all games in the game array and if they aren't checked in then append it to the array initialized above.
            if !games.checkedIn {
                gamesThatAreNotCheckedIn.append(games)
            }
        }
        for games in gamesThatAreNotCheckedIn{//then loops through everything in the gamesThatAreNotCheckedIn
            counter += 1
            print("\(counter): \(games.title)")//this gives all the games that aren't checked in.
        }
    }
}



