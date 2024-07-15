import UIKit
import Foundation


func main() {
    let time = measureTime {
        let a = [0, 0]
        // 立即執行測試
        // let l1 = ListNode.getListNode([1, 2, 4])
        // let l2 = ListNode.getListNode([1, 3, 4])
        // Solution().test(l1, l2)?.printList() ?? print("null")

        // 數組
        // print(Solution().test([]))

        // ListNode
        // let l1 = ListNode.getListNode([1, 2, 4])
        // let l2 = ListNode.getListNode([1, 3, 4])
        // Solution().test(l1, l2)?.printList() ?? print("null")

        // TreeNode
        // Solution().test(TreeNode.getTreeNode(2, 1, 3))?.printTree()

        // Stack
        // let stack = Stack(list: [1, 2, 3])
        // Solution().test(stack)

        // Queue
        // let queue = Queue(list: [1, 2, 3])
        // Solution().test(queue)
    }
    print("用時：\(time) millisecond")
}

func measureTime(block: () -> Void) -> Double {
    let start = CFAbsoluteTimeGetCurrent()
    block()
    let end = CFAbsoluteTimeGetCurrent()
    return (end - start) * 1000
}


class Solution {
   
    
}





main()













// Queue  先進先出
class Queue<T> {
    private var queue: [T] = []

    init(list: [T]) {
        for element in list {
            enqueue(element)
        }
    }

    func enqueue(_ element: T) {
        queue.append(element)
    }

    func dequeue() -> T? {
        if !queue.isEmpty {
            return queue.removeFirst()
        } else {
            return nil
        }
    }

    func printQueue() {
        for element in queue {
            print("\(element) ", terminator: "")
        }
        print()
    }
}




// Stack  先進後出
class Stack<T> {
    private var stack: [T] = []

    init(list: [T]) {
        for element in list {
            push(element)
        }
    }

    func push(_ element: T) {
        stack.append(element)
    }

    func pop() -> T? {
        return stack.popLast()
    }

    func printStack() {
        for element in stack.reversed() {
            print(element)
        }
    }
}


// ListNode
class ListNode {
    var val: Int?
    var next: ListNode?

    init(_ val: Int?) {
        self.val = val
        self.next = nil
    }

    func printList() {
        var s = val != nil ? "\(val!)" : "nil"
        var tempNode = next
        while tempNode != nil {
            if let value = tempNode!.val {
                s += " -> \(value)"
            } else {
                s += " -> nil"
            }
            tempNode = tempNode!.next
        }
        print("\(s) -> nil")
    }

    static func getListNode(_ list: [Int]) -> ListNode? {
        guard !list.isEmpty else {
            return nil
        }
        let node = ListNode(list[0])
        if list.count > 1 {
            node.next = getListNode(Array(list[1..<list.count]))
        }
        return node
    }
}



class TreeNode {
    var val: Int?
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int?) {
        self.val = val
    }

    static func getTreeNode(_ elements: Int?...) -> TreeNode? {
        return getTreeNode(elements, 0)
    }

    private static func getTreeNode(_ elements: [Int?], _ currentIndex: Int) -> TreeNode? {
        if elements.isEmpty || currentIndex >= elements.count || elements[currentIndex] == nil {
            return nil
        }
        let treeNode = TreeNode(elements[currentIndex])
        let (level, indexInLevel, levelMaxIndex) = getLevelAndIndexInLevel(currentIndex)
        let leftLeafIndex = currentIndex + (levelMaxIndex - currentIndex) + indexInLevel * 2 + 1
        if leftLeafIndex < elements.count {
            treeNode.left = getTreeNode(elements, leftLeafIndex)
        }
        if leftLeafIndex + 1 < elements.count {
            treeNode.right = getTreeNode(elements, leftLeafIndex + 1)
        }
        return treeNode
    }

    private static func getLevelAndIndexInLevel(_ index: Int) -> (Int, Int, Int) {
        var level = 0
        var levelMaxIndex = 0
        while levelMaxIndex < index {
            level += 1
            levelMaxIndex += Int(pow(2.0, Double(level)))
        }
        let indexInLevel = Int(pow(2.0, Double(level))) - 1 - (levelMaxIndex - index)
        return (level, indexInLevel, levelMaxIndex)
    }

    func printTree() {
        let buffer = StringBuilder()
        print(buffer, "", "")
        Swift.print("\(buffer.toString())")
    }

    private func print(_ buffer: StringBuilder, _ prefix: String, _ childrenPrefix: String) {
        buffer.append(prefix)
        buffer.append("\(String(describing: val))")
        buffer.append("\n")
        if let left = left {
            left.print(buffer, "\(childrenPrefix)├── ", "\(childrenPrefix)│   ")
        } else {
            buffer.append("\(childrenPrefix)└── nil\n")
        }
        if let right = right {
            right.print(buffer, "\(childrenPrefix)└── ", "\(childrenPrefix)    ")
        }
    }
}

class StringBuilder {
    private var string = ""

    func append(_ value: String) {
        string.append(value)
    }

    func toString() -> String {
        return string
    }
}
