<?php
    class Solution {
        /**
         * @param String $s
         * @return String
         */
        function clearDigits($str) {
            $strArr = str_split($str);
        
            while (preg_match('/\d/', implode($strArr))) {
                for ($index = 0; $index < count($strArr); $index++) {
                    if (is_numeric($strArr[$index])) {
                        unset($strArr[$index - 1]); // Remove the previous character
                        unset($strArr[$index]); // Remove the numeric character
                        $strArr = array_values($strArr); // Reindex the array
                        break; // Restart the loop after modification to prevent skipping
                    }
                }
            }
            
            return implode($strArr);
        }
    }
?>