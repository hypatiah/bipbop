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
