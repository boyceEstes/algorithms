import Foundation

/*
 Useful as a priority queue
 
 Heaps are very similar-looking to Binary Trees,
 however it will always be the largest number at the top. New elements will be placed
 wherever they fit in the left-most spot of the last layer.
 
 Each Node can have 0, 1, or 2 children like a normal binary tree.
 
 when removing the highest priority element, swap the root node with the last node in
 the heap, then compare the root node with each of its children and swap it
 with the child that has the highest priority
 
 repeat this step so that if the new child node is smaller than its children, it swaps again.
 
 
 Adding a new element: First add the element to the left-most position in the
 incomplete level of the heap. Then compare the priority of the new element with
 its parent. If it has a higher priority , we sift up.
 
 This is stored in an array:
    [ 8,   7,5,   6,3,2,1,     4]
level 1      2      3          4
 
 To calculate each chidl in the tree take the index of the array that you are at:
- For left: 2i + 1
- For right: 2i + 2
 
 */


struct Heap<Element>
{
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool
    
    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    mutating func buildHeap() {
        // iterate through the first half of the array in reverse order. Every level of the heap has room for twice as many elements as the level above it so you can work out that every level of the heap has one more element than every level above it combined, so the first half of the heap is actually every parent node in the heap.
        
        // One by one sift every parent node down into its children and the high priority chilren towards the top.
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    var isEmpty : Bool { return elements.isEmpty }
    var count : Int { return elements.count }
    
    func peek() -> Element? {
        return elements.first
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent)
            else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty
            else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    // Helper functions
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
            else { return parentIndex }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
}

