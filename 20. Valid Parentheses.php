<?php

class Solution {

    /**
     * @param String $s
     * @return Boolean
     */
    function isValid($s) {
        $stack = new SplStack();
        $map = [
            ')' => '(',
            '}' => '{',
            ']' => '['
        ];

        foreach (str_split($s) as $char) {
            if (isset($map[$char])) {
                if ($stack->isEmpty() || $stack->pop() !== $map[$char]) {
                    return false;
                }
            } else {
                $stack->push($char);
            }
        }

        return $stack->isEmpty();       
    }
}

// Example usage:
$solution = new Solution();
$s = "{[{()]}";
$result = $solution->isValid($s);
echo $result ? "true" : "false"; // Output: true