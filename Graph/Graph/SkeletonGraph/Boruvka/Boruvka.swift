extension SkeletonGraph {
    
    func boruvka() {
        parent = Array(repeating: 0, count: size)
        
        for i in 0..<size {
            parent[i] = i
        }
        
        weightFull = findWeight()
        weightMin = 0
        var begin = 0
        var end = 0
        
        for i in 0..<size {
            var min = weightFull
            
            for j in 0..<size {
                if matrix[i][j] == 0 { continue }
                
                if matrix[i][j] < min {
                    min = matrix[i][j]
                    end = j
                }
            }
            addEdge(i: i, j: end, weight: min)
        }
        var count = edges.count
        
        
        while count < size - 1 {
            var min = weightFull
            
            for i in 0..<size-1 {
                for j in i+1..<size {
                    if getParent(i) == getParent(j) { continue }
                    if matrix[i][j] == 0 { continue }
                    
                    if matrix[i][j] < min {
                        begin = i
                        end = j
                        min = matrix[i][j]
                    }
                }
            }
            addEdge(i: begin, j: end, weight: min)
            count += 1
        }
    }
    
    private func addEdge(i: Int, j: Int, weight: Int) {
        var begin: Int
        var end: Int
        
        if i == j { return }
        
        if i < j {
            begin = i
            end = j
        } else {
            begin = j
            end = i
        }
        
        if getParent(end) == getParent(begin) { return }
        
        let edge = Edge(begin: begin, end: end, weight: weight)
        edges.enqueue(edge)
        weightMin += weight
        
        if getParent(end) == end {
            parent[end] = getParent(begin)
        }
        if getParent(begin) == begin {
            parent[begin] = getParent(end)
        }
    }
}
