import Foundation

// Define an array containing 5 stars and 5 dots
let numberOfStar = Int.random(in: 7...15)

var skyTop = Array(repeating: "⋆", count: numberOfStar) + Array(repeating: "✩", count: numberOfStar) + Array(repeating: "✦", count: numberOfStar) + Array(repeating: "⊹", count: numberOfStar) + Array(repeating:"꙳", count: numberOfStar)

var skyBot = Array(repeating: "⋆", count: numberOfStar) + Array(repeating: "⁺", count: numberOfStar) + Array(repeating: "☁︎", count: numberOfStar) + Array(repeating: "｡", count: numberOfStar) + Array(repeating: "｡ﾟ", count: numberOfStar)


// Function to insert moon at a random position between stars and dots
func insertMoon(in array: inout [String]) {
    let moon = "☪"
    let randomIndex = Int.random(in: 0..<array.count)
    array.insert(moon, at: randomIndex)
}

// Function to print the sky array
func printSky(_ array: [String]) {
    let skyString = array.joined(separator: " ")
    print(skyString)
}

// Randomize the sequence and insert moon 5 times
for _ in 1...5 {
    skyTop.shuffle()
    if _ == 2 {
        insertMoon(in: &skyTop)
    }
    printSky(skyTop)
}


