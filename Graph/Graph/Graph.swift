

final class Graph {

    enum StateVertex {
        case detected
        case visited
        case noDetected
    }
    
    var matrix: [[Int]]
    var size: Int
    var vertex: [StateVertex]
    var edges: Stack<Edge>
    var paths: List<Int>
    
    init(matrix: [[Int]], size: Int) {
        self.matrix = matrix
        self.size = size
        self.vertex = Array(repeating: .noDetected, count: size)
        self.edges = Stack()
        self.paths = List()
    }
    
    private func clear() {
        for i in 0..<size {
            vertex[i] = .noDetected
        }
        edges.clear()
    }
    
    // поиск в глубину
    func DFS(begin: Int, end: Int, isRecurse: Bool = true) -> Bool {
        clear()
        let z: Bool = isRecurse ? DFSrec(begin: begin, end: end) : DFScyc(begin: begin, end: end)
        
        if z == false {
            return false
        }
        
        setPath(begin: begin, end: end)
        return true
    }
    
    // поиск в ширину
    func BFS(begin: Int, end: Int, isRecurse: Bool = true) -> Bool {
        let queue = Queue<Int>()
        queue.enqueue(begin)
        
        var found = false
        
        while queue.count > 0 {
            let z = queue.dequeue()!
            vertex[z] = .visited
            
            for i in 0..<size {
                if matrix[z][i] == 0 { continue }
                if vertex[i] != .noDetected { continue }
                
                let edge = Edge(begin: z, end: i)
                edges.push(new: edge)
                if i == end {
                    found = true
                    break
                }
                queue.enqueue(i)
                vertex[i] = .visited
            }
            
            if found { break }
        }
        if found {
            setPath(begin: begin, end: end)
            return true
        }
        return false
    }
    
    private func DFSrec(begin: Int, end: Int) -> Bool {
        vertex[begin] = .detected
        
        if begin == end { return true }
        
        for i in 0..<size {
            if vertex[i] != .noDetected {
                continue
            }
            if matrix[begin][i] == 0 {
                continue
            }
            let edge = Edge(begin: begin, end: i)
            edges.push(new: edge)
            if DFSrec(begin: i, end: end) { return true}
        }
        return false
    }
    
    private func DFScyc(begin: Int, end: Int) -> Bool {
        let stack = Stack<Int>()
        stack.push(new: begin)
        var found = false
        
        while stack.count > 0 {
            let z = stack.pop()!
            vertex[z] = .visited
            var i = size - 1
            
            while i >= 0 {
                i -= 1
                
                if matrix[z][i] == 0 { continue }
                if vertex[i] == .visited { continue }
                
                let edge = Edge(begin: z, end: i)
                edges.push(new: edge)
                
                if i == end {
                    found = true
                }
                if vertex[i] == .detected { continue }
                stack.push(new: i)
                vertex[i] = .detected
            }
        }
        
        return found
    }
    
    private func setPath(begin: Int, end: Int) {
        paths.clear()
        
        guard edges.count != 0 else { return }
        
        var goal = end
        paths.insert(value: goal + 1)
        for edge in edges {
            if edge.end != goal {
                continue
            }
            
            goal = edge.begin
            paths.insert(value: goal + 1)
        }
        
        paths.reverse()
    }
}
