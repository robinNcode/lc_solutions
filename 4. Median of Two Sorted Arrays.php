<?php

class Solution {
    /**
     * @param Integer[] $nums1
     * @param Integer[] $nums2
     * @return Float
     */
    function findMedianSortedArrays($nums1, $nums2) {
        $nums1 = array_merge($nums1, $nums2);
        sort($nums1);
        
        $length = count($nums1);
        $middle = floor($length/2);
        
        if($length % 2 != 0)
            $median = $nums1[$middle];
        else
            $median = ($nums1[$middle-1] + $nums1[$middle]) / 2;
            
        return $median;
    }
}