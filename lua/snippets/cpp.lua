local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("main", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "int main() {",
            "    ios::sync_with_stdio(false);",
            "    cin.tie(nullptr);",
            "",
            "    ",
        }),
        i(1),
        t({
            "",
            "    return 0;",
            "}",
        }),
    }),

    s("lc", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "class Solution {",
            "public:",
            "    ",
        }),
        i(1),
        t({
            "",
            "};",
        }),
    }),
}
