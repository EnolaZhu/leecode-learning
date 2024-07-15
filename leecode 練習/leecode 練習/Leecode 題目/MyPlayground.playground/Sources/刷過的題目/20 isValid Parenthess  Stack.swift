import Foundation
// stack
class Solution1 {
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
}
