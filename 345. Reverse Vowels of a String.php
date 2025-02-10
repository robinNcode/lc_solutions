<?php

class Solution {

    /**
     * @param String $s
     * @return String
     */
    function reverseVowels($s) {
        $inputArr = str_split($s);

        $vowels = ['a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U'];
        $vowelsInStr = [];

        foreach ($inputArr as $index => $char) {
            if (in_array($char, $vowels)) {
                $vowelsInStr[] = $char;
            }
        }

        // Reverse vowel order
        $vowelsInStr = array_reverse($vowelsInStr);

        $vowelIndex = 0;
        foreach ($inputArr as $index => $char) {
            if (in_array($char, $vowels)) {
                $inputArr[$index] = $vowelsInStr[$vowelIndex];
                $vowelIndex++;
            }
        }

        return implode('', $inputArr);
    }
}