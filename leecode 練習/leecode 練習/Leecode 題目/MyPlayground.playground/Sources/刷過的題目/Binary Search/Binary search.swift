import Foundation

//二分查找是一種高效的查找算法，適用於已排序的數組。它通過每次比較中間元素來縮小查找範圍，直到找到目標元素或範圍縮小到空間為止
// 1. sorted
// 2. mid:  let mid = left + (right - left)/2
// 3. 時間復雜度為O(logn)，空間複雜度皆為O(1)

class BinarySearch {

    // 1.
    func search(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var left = 0
        var right = n - 1

        while left <= right {
            let mid = left + (right - left)/2

            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                return mid
            }
        }

        return -1
    }


    // 2.
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n

        while left < right {
            let mid = left + (right - left)/2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
    }

    func isBadVersion(_ v: Int) -> Bool {
        // ....
         return false
    }


    // 3.
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [-1, -1] // 結果數組，初始為 [-1, -1]
        var left = 0
        var right = nums.count - 1

        // 查找左邊界
        while left < right {
            let mid = left + (right - left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        // 檢查是否找到目標值
        if left >= nums.count || nums[left] != target {
            return res // 未找到，返回 [-1, -1]
        }
        res[0] = left // 找到左邊界，設置結果數組的第一個元素

        // 查找右邊界
        left = 0
        right = nums.count - 1
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if nums[mid] > target {
                right = mid
            } else {
                left = mid
            }
        }
        // 設置結果數組的第二個元素，右邊界
        res[1] = nums[right] == target ? right : left

        return res
    }

    func findFirstBadVersion(_ versions: [Int]) -> Int {
        var left = 0
        var right = versions.count - 1
        while left < right {
            var mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }

        }
        return right
    }

}




