import Foundation


// 题目要求你从一个已排序的数组中删除重复项，并返回新的数组的长度。你需要在原地修改输入数组并使得新数组的每个元素只出现一次。

class Solution26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // inout 傳進來的參數
        guard nums.count > 1 else {
            return nums.count
        }

        var left = 0

        for right in 1..<nums.count {
            if nums[left] != nums[right] {
                // 如果 nums[fast] 和 nums[slow] 不同，则说明找到了一个新的不重复的元素，将 slow 前移一位并更新 nums[slow] 为 nums[fast]
                left += 1
                nums[left] = nums[right]
            }
        }
        return left + 1
    }
}
