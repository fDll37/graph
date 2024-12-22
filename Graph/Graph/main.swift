var matrix = [
    [0,1,1,0,1,0,1],
    [1,0,1,1,0,0,0],
    [1,1,0,0,0,0,0],
    [0,1,0,0,1,0,0],
    [1,0,0,1,0,1,0],
    [0,0,0,0,1,0,1],
    [1,0,0,0,0,1,0]
]

var size = matrix.count
var graph = SkeletonGraph(matrix: matrix, size: size)


if graph.skeletonBFS(begin: 0) {
    print("Остовое дерево")
    for egde in graph.edges {
        print("egde -> \(egde.begin + 1) - \(egde.end + 1)")
    }
}


// --------------------------------------------------------------


matrix = [
    [0,2,2,0,1,0,3],
    [2,0,3,3,0,0,0],
    [2,3,0,0,0,0,0],
    [0,3,0,0,2,0,0],
    [1,0,0,2,0,4,0],
    [0,0,0,0,4,0,2],
    [3,0,0,0,0,2,0]
]

size = matrix.count
graph = SkeletonGraph(matrix: matrix, size: size)


graph.prim(begin: 0)
print("Минимальное Остовое дерево (Prim)")
for egde in graph.edges {
    print("Egde -> \(egde.begin + 1) - \(egde.end + 1). Weight -> \(egde.weight)")
}
print("Вес ребер минмального остовного дерева - \(graph.weightMin)")



// --------------------------------------------------------------


matrix = [
    [0,2,2,0,1,0,3],
    [2,0,3,3,0,0,0],
    [2,3,0,0,0,0,0],
    [0,3,0,0,2,0,0],
    [1,0,0,2,0,4,0],
    [0,0,0,0,4,0,2],
    [3,0,0,0,0,2,0]
]

size = matrix.count
graph = SkeletonGraph(matrix: matrix, size: size)


graph.kruskal()
print("Минимальное Остовое дерево (Kruskal)")
for egde in graph.edges {
    print("Egde -> \(egde.begin + 1) - \(egde.end + 1). Weight -> \(egde.weight)")
}
print("Вес ребер минмального остовного дерева - \(graph.weightMin)")



// --------------------------------------------------------------


matrix = [
    [0,2,2,0,1,0,3],
    [2,0,3,3,0,0,0],
    [2,3,0,0,0,0,0],
    [0,3,0,0,2,0,0],
    [1,0,0,2,0,4,0],
    [0,0,0,0,4,0,2],
    [3,0,0,0,0,2,0]
]

size = matrix.count
graph = SkeletonGraph(matrix: matrix, size: size)


graph.kruskal()
print("Минимальное Остовое дерево (Boruvka)")
for egde in graph.edges {
    print("Egde -> \(egde.begin + 1) - \(egde.end + 1). Weight -> \(egde.weight)")
}
print("Вес ребер минмального остовного дерева - \(graph.weightMin)")
