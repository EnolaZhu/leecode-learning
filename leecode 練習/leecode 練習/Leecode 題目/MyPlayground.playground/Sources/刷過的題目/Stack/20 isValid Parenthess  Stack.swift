import Foundation
// stack

/*
 Input: s = "()"
 Output: true

 Input: s = "()[]{}"
 Output: true

 Input: s = "(]"
 Output: false
 */
class Solution20 {
    var map: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    
    func isValid(_ s: String) -> Bool {
        var leftBlock: [Character] = []
        
        for char in s {
            switch char {
            case "(", "[", "{":
                leftBlock.append(char)
            case ")", "]", "}":
                if leftBlock.isEmpty || map[char] != leftBlock.last {
                    return false
                } else {
                    leftBlock.removeLast()
                }
            default:
                break
            }
        }
        
        return leftBlock.isEmpty
    }



    func isValid2(_ s: String) -> Bool {

        var map = ["(": ")",
                   "{": "}",
                   "[": "]"]
        var leftBlock: [Character] = []

        for char in s {
            switch char {
            case "(", "{", "[":
                leftBlock.append(char)
            case ")", "}", "]":
                if leftBlock.isEmpty || char != map[leftBlock.last] {
                    return false
                } else {
                    leftBlock.removeLast()
                }
            default:
                return false
            }
        }
        return leftBlock.isEmpty

    }
}
