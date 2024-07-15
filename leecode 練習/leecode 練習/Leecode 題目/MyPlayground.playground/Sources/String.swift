import Foundation


let str = "Hello"
let lowerCasedStr = str.lowercased()

let str = "Hello"
for char in str {
    print(char) // charactor type
}

let charArray = Array(str) // ["Hello"]

let length = str.count // 5

let firstChar = str.first // Optional("H")
let lastChar = str.last // Optional("o")


let thirdChar = str[str.index(str.startIndex, offsetBy: 2)] // "l"
// 時間複雜度是 O(n)
// 效能更好可以選擇轉成 Array

let str1 = "Hello"
let str2 = " World"
let combinedStr = str1 + str2 // "Hello World"

let str1 = "Hello"
let str2 = "Hello"
if str1 == str2 {
    print("Strings are equal")
}

let str = "Hello, World"
let containsWorld = str.contains("World") // true
let replacedStr = str.replacingOccurrences(of: "World", with: "Swift") // "Hello, Swift"


let str = "apple,banana,orange"
let fruits = str.split(separator: ",") // ["apple", "banana", "orange"]
let combinedFruits = fruits.joined(separator: " & ") // "apple & banana & orange"


// Character 转 String：

let char: Character = "H"
let str1 = "\(char)" // "H"

let str2 = String(char) // "H"

let str3 = "H" // "H"


private func isAlphanumeric(_ c: Character) -> Bool {
    // 跳過非數字字母 character
    if ("a"..."z").contains(c) || ("A"..."Z").contains(c) || ("0"..."9").contains(c) {
        return true
    }
    return false
}


func isPalindrome(_ s: String) -> Bool {
    let clean
}
