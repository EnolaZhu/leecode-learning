import Foundation

class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//Input: list1 = [1,2,4], list2 = [1,3,4]
//Output: [1,1,2,3,4,4]

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // dummy 节点作为辅助节点，它的 next 指针将最终指向合并后的链表的头节点。
        // current 节点用于构建和遍历新链表，初始时指向 dummy 节点。
        var l1 = list1 // 需要一直更新節點 更新 point
        var l2 = list2
        let dummy = ListNode(0)
        var current = dummy
        
        // 合并两个链表
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current.next = l1
                l1 = l1?.next
            } else {
                current.next = l2
                l2 = l2?.next
            }
            // 移动指针到新链表的末尾
            current = current.next!
        }
        
        // l1 or l2 是 nil
        if l1 == nil {
            current.next = l2
        } else {
            current.next = l1
        }
        
        return dummy.next
        
    }
    
}
