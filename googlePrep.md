#Google Prep

##Monday November 21, 2016

###Merge Sort
Sort half of A and the right of A, then combine them.

Mergesort(A) steps:
1. return A if n == 1
2. left = left half of A
3. right = right half of A
4. sorted_left = Mergesort(left)
5. sorted_right = Mergesort(right)
6. return merge(sorted_left, sorted_right)

def mergesort(array)
  def merge(left_sorted, right_sorted)
    res = []
    l = 0
    r = 0
    until (r >= right_sorted.length) && (l >= left_sorted.length)

      if r >= right_sorted.length || (l < left_sorted.length && (left_sorted[l] < right_sorted[r]))
        res << left_sorted[l]
        l += 1
      else
        res << right_sorted[r]
        r += 1
      end
    end

    return res
  end

  def mergesort_iter(array_sliced)
    return array_sliced if array_sliced.length <= 1

    mid = array_sliced.length/2 - 1
    left_sorted = mergesort_iter(array_sliced[0..mid])
    right_sorted = mergesort_iter(array_sliced[mid+1..-1])
    return merge(left_sorted, right_sorted)
  end

  mergesort_iter(array)
end


###QuickSort

##Tuesday November 22, 2016
### Hashing
Hashing is where there's a one to one relationship between key and value.
Keys are transformed into array indices using a hash function, and the value is stored at that array index location.

In other words...
**Key --> hashing function: transforms key into index of an array -> value stored at that index**
Ideally, different keys map to different indices


We have three primary requirements in implementing a good hash function for a given data type:
1. It should be deterministic—equal keys must produce the same hash value.
2. It should be efficient to compute.
3. It should uniformly distribute the keys.

A hash function:
  1. converts keys into array indices.
  2. has collision resolution: a strategy for handling the case when two or more keys to be inserted hash to the same index.

Straightforward approach to collision resolution: For each of the M array indices, build a linked list of the key-value pairs whose keys hash to that index.
Basically, choose M to be sufficiently large that the lists are sufficiently short to enable efficient search through a two-step process: hash to find the list that could contain the key, then sequentially search through that list for the key.

### What happens when you type www.google.com?
Mapping of URl to an IP address
Browser makes an HTTP GET request to hits DNS server which has the IP address, then the information about the page is stored in another server.
That server gives back the content, lets say in form of HTML document. Sends it back to the DNS server, which has a mapping to send back info to the IP adress.
Once the browser receives it, it renders it on the DOM.

Might send to a load balancer, connected to identical servers, and the load balancer which decides where to send the request based on servers with optimal space.

Load balancers can be placed anywhere where there is a huge amount of traffic.

**Single point of failure:**
document x - stored in Server 1
document y - stored in Server 2

if 100 requests shut down server 1, would not be able to access document X.

To avoid single point of failure, Server 2 should have document y AND x.


##Friday November 25. 2016
###Binary Tree Traversal: BFS AND DFS
BFS will find the shortest path every single time. DFS may, but it is not guaranteed.

####DFS (Depth First Search):
**Difference between Preorder, Inorder and Postorder:**
Preorder <root><left><right> - recursively
Inorder <left><root><right>
Postorder <left><right><root>

*Note: conventionally start with left before right*

##Sunday November 27, 2016
Because JS uses lexical scoping, variables available outside functions are available inside functions.

`var passed = 3;
var addTo = function () {
  var inner = 2;
  return passed + inner;
}

console.dir(addTo); \\prints function, and in chrome dev console if you expand function scope and expand closure, you will see "passed: 3"`

###Difference between console.log and console.dir
`console.log` prints the element in an HTML-like tree
`console.dir` prints the element in a JSON-like tree

Specifically, `console.log` gives special treatment to DOM elements, whereas `console.dir` does not. This is often useful when trying to see the full representation of the DOM JS object.

ex:
`console.log([1,2,3])
=> [1, 2, 3]
console.dir([1,2,3])
=> Array[3]`
however both expand to the same:
`0: 1
1: 2
2: 3
length: 3
* _proto_: Array[0]
`
Closure: functions with preserved data

Callback functions:
functions are first-class objects

Events and arrays are **both** collections.

## Monday, November 28th 2016

In CS, a thread of execution is the smallest sequence of programmed instructions that can be managed independently by a scheduler, which is typically part of the operating system

*in other words..*
operating system > scheduler > thread = sequence of programmed instructions

thread E process E scheduler E operating system

In most cases a thread is a component of a process.
Multiple threads can exist within one process. Multiple threads within a process execute concurrently and share resources like memory. Whereas different processes don't share memory.

The threads of a process share values of its variables and the executable code.

Typically, systems with 1 processor implement multithreading by time slicing.

Time slicing is when the CPU (central processing unit) switches between different software threads.

##Sunday, December 4th 2016
###Structure Design
if given system design, don't care about monthly users, but how many at peak
are they geographically distributed

what percent are active every day? 70%
what percent of daily users are active at peak hours? 70%
i.e. if its geographically clustered, then will have a big cluster of people at the same time of daily

how many are using it at one hour, per minute each hour?
at peak time, have maybe 68k concurrent users at peak hour traffic users
if it was a typical poorly optimized js application in node,  can only support 1,000 people per server
so would need 68K servers

now what does server need to do, what specific tasks does it need to take on

if have 70k in mobile devices, how much will they send to server,
whats max can you put through phone to not interfere with connection
novice: half a megabyte a minute
mediocre: say log 100 actions per minute, how many arbitrary data would be packaged in, how many integers, how many strings
best answer: how much bandwidth do we have to take out to , if we did half a meg a minute, that would be 30 megs per hour, so maybe 10, 13 megs an hour will fit into   ithat may be too expensive for the user.
make upper bound, just because can log more data, doesnt mean you should. megabytes of data are expensive and time consuming, if you're in an underdeveloped region that can be very expensice.
maybe use 10, 15 or 20k bytes of data per minute, not 500k (like the novice may say)

what is server side going to look like.
long term storage to the logs. allow resolution to deteriorate over time?

##Tuesday, December 6th 2016
- implement system routines
  - distill large data sets into single values
- system design:
         - feature sets
         - interfaces
         - class hierarchies
    - system design continued:
         - designing system under certain constraints
         - simplicity and robustness - tradeoffs

###Overloading vs. Overriding in Java
In Java,
Overloading: when two methods have same name but differ in the type or number of arguments.
ex:
`public double computeArea(Circle c) { ... }
public double computeArea(Square s) { ... }`
Overriding: when a method shares the same name and function signature as another method in its super class.
`public abstract class Shape {
  public void printMe() {
    System.out.println("I am a shape.");
  }
  public abstract double computeArea();
}`

In Java, **Vector** is very similar to an **ArrayList** but Vectors are synchronized.

**synchronized**: synchronized blocks the next thread's call to method test() as long as the previous thread's execution is not finished. Threads can access this method one at a time. Without synchronized all threads can access this method simultaneously.

"When you have two threads that are reading and writing to the same 'resource', say a variable named foo, you need to ensure that these threads access the variable in an atomic way. Without the synchronized keyword, your thread 1 may not see the change thread 2 made to foo, or worse, it may only be half changed. This would not be what you logically expect."
