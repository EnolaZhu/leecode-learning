import Foundation

// for-in
let array = [1, 2, 3, 4, 5]
for element in array {
    print(element)
}

let dictionary = ["one": 1, "two": 2, "three": 3]
for (key, value) in dictionary {
    print("\(key): \(value)")
}

let set: Set = [1, 2, 3, 4, 5]
for element in set {
    print(element)
}


// forEach
let array1 = [1, 2, 3, 4, 5]
array.forEach { element in
    print(element)
}

let dictionary1 = ["one": 1, "two": 2, "three": 3]
dictionary.forEach { (key, value) in
    print("\(key): \(value)")
}

let set1: Set = [1, 2, 3, 4, 5]
set.forEach { element in
    print(element)
}

// enumerated()
let array2 = [1, 2, 3, 4, 5]
for (index, element) in array.enumerated() {
    print("Index \(index): \(element)")
}

let dictionary2 = ["one": 1, "two": 2, "three": 3]
var index = 0
for (key, value) in dictionary {
    print("Index \(index): \(key): \(value)")
    index += 1
}


// while 循环

let array = [1, 2, 3, 4, 5]
var index = 0
while index < array.count {
    print(array[index])
    index += 1
}

let array = [1, 2, 3, 4, 5]
var index = 0
repeat {
    print(array[index])
    index += 1
} while index < array.count


// 使用迭代器迭代集合

let array = [1, 2, 3, 4, 5]
var iterator = array.makeIterator()
while let element = iterator.next() {
    print(element)
}
