<?php

class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function missingNumber($nums) {
        $result = 0;
        $main_arr = range(0, count($nums));

        foreach ($nums AS $num){
            $all_others[$num] = true; 
        }

        foreach ($main_arr AS $arr){
            if(!isset($all_others[$arr])){
                $result = $arr;
                break;
            }
        }

        return $result;
    }
}

$solution = new Solution();
$nums = [0, 2];
$result = $solution->missingNumber($nums);
echo "Missing number is: " . $result . PHP_EOL;