import Foundation

/**
 class TreeNode {
     var val: Int
     var left: TreeNode?
     var right: TreeNode?

     init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
 
 Input: root = [4,2,7,1,3,6,9]
 Output: [4,7,2,9,6,3,1]
 
 */

class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        // 交换左右子树
        let left = root.left
        root.left = root.right
        root.right = left
        
        
        // 递归翻转左右子树
        invertTree(root.left)
        invertTree(root.right)
        
        return root
    }
}
