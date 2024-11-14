import Foundation

/* 
 Input: s = "anagram", t = "nagaram"
 Output: true

 Input: s = "rat", t = "car"
 Output: false
 */

class Solution {
    func isAnagram1(_ s: String, _ t: String) -> Bool {
        s = ""
        let s1 = s.sorted()
        let t1 = t.sorted()

        return s1 == t1
    }
}
