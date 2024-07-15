import Foundation


//Input: s = "A man, a plan, a canal: Panama"
//Output: true
//Explanation: "amanaplanacanalpanama" is a palindrome.
//Example 2:
//
//Input: s = "race a car"
//Output: false
//Explanation: "raceacar" is not a palindrome.

class Solution2 {
    
    func isPalindrome(_ s: String) -> Bool {

        let alphanumericStr = Array(filterAlphanumericString(s))
        var i = 0
        var j = alphanumericStr.count - 1

        while i < j {
            // 把alphanumericStr 轉成 array 複雜度變 O(1)
            // alphanumericStr[alphanumericStr.index(alphanumericStr.startIndex, offsetBy: i)] 這樣寫 複雜度變 O(n)
            if alphanumericStr[i] == alphanumericStr[j] {
                i += 1
                j -= 1
            } else {
                return false
            }
        }
        return true
    }

    // filter and lowercase string first
    func filterAlphanumericString(_ s: String) -> String {
        let filteredString = s.lowercased().filter {
            $0.isLetter || $0.isNumber
        }
        return filteredString
    }
}
