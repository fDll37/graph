extension SkeletonGraph {
    
    func kruskal() {
        weightMin = 0
        let list = List<Edge>()
        
        for i in 0..<size {
            for j in i+1..<size {
                if matrix[i][j] == 0 { continue }
                let edge = Edge(begin: i, end: j, weight: matrix[i][j])
                list.insert(value: edge)
            }
        }
        list.sort {$0.weight < $1.weight}
        
        parent = Array(repeating: 0, count: size)
        for i in 0..<size {
            parent[i] = i
        }
        
        for e in list {
            let begin = getParent(e.begin)
            let end = getParent(e.end)
            if begin == end { continue }
            
            edges.enqueue(e)
            weightMin += e.weight
            parent[end] = begin
        }
    }
    
    func getParent(_ v: Int) -> Int {
        if parent[v] == v { return v }
        return getParent(parent[v])
    }
}
