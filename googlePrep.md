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
