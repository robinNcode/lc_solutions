class Solution:
    def myAtoi(self, s: str) -> int:
        import re
        if re.search(r'^(\s+)?([-+]?\d+)', s):
            return min(2147483647, max(-2147483648, int(re.findall(r'^(\s+)?([-+]?\d+)', s)[0][1])))
        return 0