<?php

class Solution
{
    /**
     * To find the minimum number of operations required so that all elements in the array are >= k
     * using Sorting (Without Heap or Hashmap).
     * 
     * @param array $nums - The input array of integers.
     * @param int $k - The threshold value.
     * @return int - The minimum number of operations.
     */
    function minOperations(array $nums, int $k): int
    {
        sort($nums); // Sort the array initially
        $operations = 0;

        while ($nums[0] < $k) {
            // Take the two smallest elements
            $x = array_shift($nums);
            $y = array_shift($nums);

            // Compute new value
            $newValue = ($x * 2) + $y;

            // Insert the new value in sorted position
            $index = $this->binaryInsert($nums, $newValue);

            $operations++;
        }

        return $operations;
    }

    /**
     * Inserts an element into a sorted array in its correct position.
     * 
     * @param array &$arr - Reference to the sorted array.
     * @param int $value - The value to insert.
     * @return int - The index where the value was inserted.
     */
    function binaryInsert(array &$arr, int $value): int
    {
        $left = 0;
        $right = count($arr);

        // Perform binary search to find the correct insertion index
        while ($left < $right) {
            $mid = intdiv($left + $right, 2);
            if ($arr[$mid] < $value) {
                $left = $mid + 1;
            } else {
                $right = $mid;
            }
        }

        // Insert the value at the found position
        array_splice($arr, $left, 0, $value);
        return $left;
    }
}
