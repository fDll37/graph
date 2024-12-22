extension SkeletonGraph {
    
    func findWeight() -> Int {
        var w = 0
        for i in 0..<size {
            for j in 0..<size {
                w += matrix[i][j]
            }
        }
        
        return w
    }
    
    func prim(begin: Int) {
        vertex[begin] = .visited
        var count = 1
        weightFull = findWeight()
        weightMin = 0
        
        while count < size {
            let edge = searchMin()
            edges.enqueue(edge)
            vertex[edge.end] = .visited
            count += 1
        }
    }
    
    func searchMin() -> Edge {
        var minWeight = weightFull
        var begin = 0
        var end = 0
        
        for i in 0..<size {
            if vertex[i] == .noDetected { continue }
            
            for j in 0..<size {
                if vertex[j] != .noDetected { continue }
                if matrix[i][j] == 0 { continue }
                if matrix[i][j] < minWeight {
                    minWeight = matrix[i][j]
                    begin = i
                    end = j
                }
            }
        }
        
        weightMin += minWeight
        return Edge(begin: begin, end: end, weight: minWeight)
    }
}
