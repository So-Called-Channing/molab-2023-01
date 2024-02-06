//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Day 2 Playground

// It returns boolean
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number1 = 120
print(number1.isMultiple(of: 3))

// To flip the boolean's value

// #1 by using "!"
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// #2 "toggle()" function
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)


// To join strings together

// #1 by using "+"
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"
print(luggageCode)

// String interpolation

// Backslash allows us to include double quotes inside the string:
let quote = "Then he tapped a sign saying \"Believe\" and walked away."
print(quote)

// *NO* integer allowed to added on to strings by using "+", change it to string before the addition:
let number = 11
let missionMessage = "Apollo " + String(number) + " landed on the moon."
print(missionMessage)

// Or use the backslash:
let missionMessage1 = "Apollo \(number) landed on the moon."
print(missionMessage1)

// Calculation is allowed inside the string interpolation.
print("5 x 5 is \(5 * 5)")


// Checkpoint 1
// Your goal is to write a Swift playground that:
// Creates a constant holding any temperature in Celsius.
// Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
// Prints the result for the user, showing both the Celsius and Fahrenheit values.

let celsius = 27
let fahrenheit = celsius * 9 / 5 + 32
print("""
celsius: \(celsius)
fahrenheit: \(fahrenheit)
""")


// Day 3 Playground

//Array refers to the dataset using the same rules as variable and constant
var beatles = ["John", "Paul", "George", "Ringo"]
print(beatles[0])
beatles.append("Adrian")
print(beatles)

// *NO* String added to integer
let numbers = [4, 8, 15, 16, 23, 42]
let firstBeatle = beatles[0]
let firstNumber = numbers[0]
// let notAllowed = firstBeatle + firstNumber

// Turn integers into strings resolve this
let allowed = firstBeatle + String(firstNumber)
print(allowed)

// Create the empty array with specific definition of value type:
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// in short:
var scores1 = [Int]()
scores1.append(100)
scores1.append(80)
scores1.append(85)
print(scores1[1])

// To count # of items in the array:
print(scores.count)

// To remove a specific item or remove all items in the array:
scores.remove(at: 2)
print(scores.count)
print(scores)

scores1.removeAll()
print(scores1)

// To check if the array contains a particular item, it returns boolean
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

// To sort the array items in ascending order:
print(bondMovies.sorted())

// To reverse an array:
let presidents = ["Bush", "Obama", "Trump", "Biden"]
print(presidents.reversed())


// Dictionary:
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

// It returns default value if there's no such a key
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// Indicate the type when creating the empty array:
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
print(archEnemies)

let olympics = [2012: "London", 2016: "Rio", 2020: "Tokyo"]
let london = olympics[2012]

let planets = [1: "Mercury", 2: "Venus"]
let venus = planets[2, default: "Planet X"]
print(venus)

let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]
print(scotlandCapital)

let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]
print(dickens)


// Set

// Empty set



// Enumeration
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
var day = Weekday.monday
day = Weekday.tuesday
day = .friday

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .snow {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}

// Checkpoint 2
let zodiacInClass = ["Aries", "Taurus", "Gemini", "Aries", "Capricorn", "Leo", "Capricorn", "Scorpion"]
print(zodiacInClass.count)
let zodiacSet = Set(zodiacInClass)
print(zodiacSet.count)



// Checkpoint 3
for i in 1...100{
    if i.isMultiple(of: 3) && i.isMultiple(of: 5){
            print("FizzBuzz")
        }
    else if i.isMultiple(of: 3){
        print("Fizz")
    }
    else if i.isMultiple(of: 5){
        print("Buzz")
    }
    else{
        print(i)
    }
}



func getUser() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user = getUser()
print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")

func getUser1() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user1 = getUser1()
print("Name: \(user1.firstName) \(user1.lastName)")



