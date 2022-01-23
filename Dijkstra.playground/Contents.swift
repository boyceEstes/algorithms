import Foundation

/*
 Dijkstra solves shortest path problems that have non-negative edges. This will work on
 both directed and undirected paths. Works with Cycles
 
 Start at Node.
 - Determine all rooms that are connected to the current node
 - Prioritize them by distance, shortest first
 - visit that shortest distance room
 - add the new neighbors to the distance priority queue.
 - visit the shortest distance (this does not have to be directly connected to the current location
 
 dijkstra(g, w, s) {
    initialize(g, s) -> s=nil, q=v[G]
    while Q (vertices that need to be processed) {
        extract u from q
        
    }
 
 */

//var heap = Heap(elements: [3, 2, 8, 5, 0], priorityFunction: >)

var priorityQueue = PriorityQueue<Int>(sort: >)
priorityQueue.enqueue(5)
priorityQueue.enqueue(2)
priorityQueue.enqueue(10)
priorityQueue.enqueue(8)
priorityQueue.enqueue(20)
print("Results")
print(priorityQueue)
