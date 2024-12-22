class NodeList<T> {
    var value: T
    var next: NodeList<T>?
    
    init(value: T) {
        self.value = value
    }
}

final class List<T> {
    var head: NodeList<T>?
    var count = 0
    
    subscript(index: Int) -> T? {
        get {
            guard index < count else { return nil }
            var current = head
            for _ in 0..<index {
                current = current?.next
            }
            return current?.value
        }
        set {
            guard index < count else { return }
            var current = head
            for _ in 0..<index {
                current = current?.next
            }
            if let newValue = newValue {
                current?.value = newValue
            }
        }
    }
    
    func insert(value: T, index: Int = 0) {
        let node = NodeList(value: value)
        var current = head
        var previous: NodeList<T>? = nil
        
        if index == 0 || head == nil {
            node.next = head
            head = node
        } else {
            var i = 0
            while i < index && current != nil {
                previous = current
                current = current?.next
                i += 1
            }
            previous?.next = node
            node.next = current
        }
        count += 1
    }
    
    func remove(index: Int) {
        guard index < count else { return }
        var current = head
        var previous: NodeList<T>? = nil
        
        if index == 0 {
            head = current?.next
        } else {
            for _ in 0..<index {
                previous = current
                current = current?.next
            }
            previous?.next = current?.next
        }
        count -= 1
    }
    
    func clear() {
        head = nil
        count = 0
    }
    
    func reverse() {
        var prev: NodeList<T>? = nil
        var current = head
        var next: NodeList<T>? = nil
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
    
    func any() -> Bool {
        return head != nil
    }
    
    func sort(by areInIncreasingOrder: (T, T) -> Bool) {
        head = mergeSort(head, by: areInIncreasingOrder)
    }

    private func mergeSort(_ node: NodeList<T>?, by areInIncreasingOrder: (T, T) -> Bool) -> NodeList<T>? {
        // Базовый случай: 0 или 1 элемент в списке
        guard let node = node, node.next != nil else {
            return node
        }
        
        // Разделение списка на две половины
        let (left, right) = split(node)
        
        // Рекурсивная сортировка каждой половины
        let sortedLeft = mergeSort(left, by: areInIncreasingOrder)
        let sortedRight = mergeSort(right, by: areInIncreasingOrder)
        
        // Слияние отсортированных половин
        return merge(sortedLeft, sortedRight, by: areInIncreasingOrder)
    }

    private func split(_ node: NodeList<T>) -> (NodeList<T>?, NodeList<T>?) {
        var slow: NodeList<T>? = node
        var fast: NodeList<T>? = node.next
        
        // Найти середину списка
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        let middle = slow?.next
        slow?.next = nil // Разрываем список на две части
        
        return (node, middle)
    }

    private func merge(_ left: NodeList<T>?, _ right: NodeList<T>?, by areInIncreasingOrder: (T, T) -> Bool) -> NodeList<T>? {
        let dummy = NodeList(value: left!.value) // Временная голова списка
        var tail: NodeList<T>? = dummy
        var left = left
        var right = right
        
        while let leftNode = left, let rightNode = right {
            if areInIncreasingOrder(leftNode.value, rightNode.value) {
                tail?.next = leftNode
                left = leftNode.next
            } else {
                tail?.next = rightNode
                right = rightNode.next
            }
            tail = tail?.next
        }
        
        // Добавляем оставшиеся элементы
        tail?.next = left ?? right
        
        return dummy.next
    }

}

extension List: Sequence {
    func makeIterator() -> ListIterator {
        ListIterator(head: self.head)
    }
    
    struct ListIterator: IteratorProtocol {
        var current: NodeList<T>?
        
        init(head: NodeList<T>?) {
            self.current = head
        }
        
        mutating func next() -> T? {
            if let value = current?.value {
                current = current?.next
                return value
            }
            return nil
        }
    }
}
