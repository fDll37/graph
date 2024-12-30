//var matrix = [
//    [0,1,1,0,1,0,1],
//    [1,0,1,1,0,0,0],
//    [1,1,0,0,0,0,0],
//    [0,1,0,0,1,0,0],
//    [1,0,0,1,0,1,0],
//    [0,0,0,0,1,0,1],
//    [1,0,0,0,0,1,0]
//]
//
//var size = matrix.count
//var graph = SkeletonGraph(matrix: matrix, size: size)
//
//
//if graph.skeletonBFS(begin: 0) {
//    print("Остовое дерево")
//    for egde in graph.edges {
//        print("egde -> \(egde.begin + 1) - \(egde.end + 1)")
//    }
//}


// --------------------------------------------------------------


//matrix = [
//    [0,2,2,0,1,0,3],
//    [2,0,3,3,0,0,0],
//    [2,3,0,0,0,0,0],
//    [0,3,0,0,2,0,0],
//    [1,0,0,2,0,4,0],
//    [0,0,0,0,4,0,2],
//    [3,0,0,0,0,2,0]
//]
//
//size = matrix.count
//graph = SkeletonGraph(matrix: matrix, size: size)
//
//
//graph.prim(begin: 0)
//print("Минимальное Остовое дерево (Prim)")
//for egde in graph.edges {
//    print("Egde -> \(egde.begin + 1) - \(egde.end + 1). Weight -> \(egde.weight)")
//}
//print("Вес ребер минмального остовного дерева - \(graph.weightMin)")
//


// --------------------------------------------------------------


//matrix = [
//    [0,2,2,0,1,0,3],
//    [2,0,3,3,0,0,0],
//    [2,3,0,0,0,0,0],
//    [0,3,0,0,2,0,0],
//    [1,0,0,2,0,4,0],
//    [0,0,0,0,4,0,2],
//    [3,0,0,0,0,2,0]
//]
//
//size = matrix.count
//graph = SkeletonGraph(matrix: matrix, size: size)
//
//
//graph.kruskal()
//print("Минимальное Остовое дерево (Kruskal)")
//for egde in graph.edges {
//    print("Egde -> \(egde.begin + 1) - \(egde.end + 1). Weight -> \(egde.weight)")
//}
//print("Вес ребер минмального остовного дерева - \(graph.weightMin)")



// --------------------------------------------------------------


//matrix = [
//    [0,2,2,0,1,0,3],
//    [2,0,3,3,0,0,0],
//    [2,3,0,0,0,0,0],
//    [0,3,0,0,2,0,0],
//    [1,0,0,2,0,4,0],
//    [0,0,0,0,4,0,2],
//    [3,0,0,0,0,2,0]
//]
//
//size = matrix.count
//graph = SkeletonGraph(matrix: matrix, size: size)
//
//
//graph.kruskal()
//print("Минимальное Остовое дерево (Boruvka)")
//for egde in graph.edges {
//    print("Egde -> \(egde.begin + 1) - \(egde.end + 1). Weight -> \(egde.weight)")
//}
//print("Вес ребер минмального остовного дерева - \(graph.weightMin)")


// --------------------------------------------------------------
//
//
//let matrix = [
//    [0, -2, 5, 7],
//    [ 0, 0, 6, 8],
//    [ -1, 0, 0, 0],
//    [ 0, 3, -4, 0]
//    
//]
//
//let size = matrix.count
//let graph = ShortestGraph(matrix: matrix, size: size)
//
//let ways = graph.floidWarshell()
//
//print("Минимальный путь")
//print("    ")
//
//for i in 0..<size {
//    print("\(i + 1)", terminator: "   ")
//}
//
//print("    ")
//
//for i in 0..<size {
//    print("\(i + 1): ", terminator: " ")
//    for j in 0..<size {
//        print("\(ways[i][j])", terminator: "  ")
//    }
//    print("")
//}

// --------------------------------------------------------------



let matrix = [
    [0,  7,  9,  0,  0, 14 ],
    [7,  0, 10, 15,  0,  0 ],
    [9, 10,  0, 11,  0,  2 ],
    [0, 15, 11,  0,  6,  0 ],
    [0,  0,  0,  6,  0,  9 ],
    [14,  0,  2,  0,  9,  0]
]

let size = matrix.count
let graph = ShortestGraph(matrix: matrix, size: size)


for vertex in 0..<size {
    let ways = graph.deikstra(vertex: vertex)
    print("Минимальный путь из вершины \(vertex + 1): ")
    
    for i in 0..<size {
        print("  \(ways[i]) ")
    }
    print()
}
