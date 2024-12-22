final class Edge {
    let begin: Int
    let end: Int
    let weight: Int
    
    init(begin: Int, end: Int, weight: Int = 1) {
        self.begin = begin
        self.end = end
        self.weight = weight
    }
    
}


extension Edge: Comparable {
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight == rhs.weight
    }
    
    
}
