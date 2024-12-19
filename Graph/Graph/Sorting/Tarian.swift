extension Graph {
    
    func tarianSort() -> Bool {
        
        paths.clear()
        let stack = Stack<Int>()
        
        for i in 0..<size {
            if vertex[i] == .noDetected {
                if DFSwithStack(v: i, stack: stack) == false {
                    return false
                }
            }
        }
        
        while stack.any() {
            paths.insert(value: stack.pop()!)
        }
        
        return true
    }
    
    
    func DFSwithStack(v: Int, stack: Stack<Int>) -> Bool {
        vertex[v] = .visited
        
        for i in 0..<size {
            if matrix[v][i] == 0 { continue }
            if vertex[i] == .noDetected {
                if DFSwithStack(v: i, stack: stack) == false {
                    return false
                }
            }
        }
        
        vertex[v] = .detected
        stack.push(new: v + 1)
        return true
    }
}
