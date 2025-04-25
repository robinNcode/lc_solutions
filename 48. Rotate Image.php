<?php

class Solution {

    /**
     * @param Integer[][] $matrix
     * @return NULL
     */
    function rotate(&$matrix) {
        $length = $max = count($matrix) - 1;
        $min = 0;
        $temp = $matrix;
        
        for($rows = 0; $rows <= $length; $rows++){
            for($columns = $min; $columns <= $length; $columns++){
                $matrix[$min][$max] = $temp[$rows][$columns];
                $min++;
            }
            $min = 0;
            $max--;
        }

        return $matrix;
    }
}

$matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];

$solution = new Solution();
var_dump($solution->rotate($matrix));
