import Foundation

class Solution217 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let removeDuplicatedNums = Set(nums)
        if removeDuplicatedNums.count != nums.count {
            return true
        } else {
            return false
        }
    }
    
    // 空間換時間
    func containsDuplicate1(_ nums: [Int]) -> Bool {
        var set = Set(nums)
        
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                return false
            }
        }
    }
}
