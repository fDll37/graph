final class SkeletonGraph {
    
    enum StateVertex {
        case detected
        case visited
        case noDetected
    }
    
    var matrix: [[Int]]
    var size: Int
    var vertex: [StateVertex]
    var edges: Queue<Edge>
    var weightFull = 0
    var weightMin = 0
    var parent: [Int]
    
    init(matrix: [[Int]], size: Int) {
        self.matrix = matrix
        self.size = size
        self.vertex = Array(repeating: .noDetected, count: size)
        self.edges = Queue()
        self.parent = []
    }
    
    
    func skeletonBFS(begin: Int) -> Bool {
        
        let queue = Queue<Int>()
        queue.enqueue(begin)
        
        while queue.count > 0 {
            let z = queue.dequeue()!
            vertex[z] = .visited

        
            for i in 0..<size {
                if matrix[z][i] == 0 { continue }
                if vertex[i] != .noDetected { continue }
                
                let edge = Edge(begin: z, end: i)
                edges.enqueue(edge)
                queue.enqueue(i)
                vertex[i] = .visited
            }
        }
        
        return true
    }
}
