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
