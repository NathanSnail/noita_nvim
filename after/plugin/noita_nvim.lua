print(require("cmp"))
print("after")
require("cmp").register_source("noita", require("noita_nvim").new())
