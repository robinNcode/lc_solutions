<?php

class Solution {

    /**
     * @param int[] $nums
     * @param int $k
     * @return Float
     */
    function findMaxAverage($nums, $k) {
        $total_nums = count($nums);
        $max_sum = $current_sum = array_sum(array_slice($nums, 0, $k));
        
        for($index = $k; $index < $total_nums; $index++){
            $current_sum = $current_sum - $nums[$index - $k] + $nums[$index];

            if($current_sum > $max_sum){
                $max_sum = $current_sum;
            }
        }

        return $max_sum / $k;
    }
}


$series = [5];
$fixedNumber = 1;
$solution = new Solution();
$result = $solution->findMaxAverage($series, $fixedNumber);

echo "The maximum total of $fixedNumber consecutive elements is: $result\n";