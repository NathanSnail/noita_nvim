local cmp = require("cmp")

print("noita nvim init!")
---@module "cmp_types"
local source = {}

function source.new()
	return setmetatable({}, { __index = source })
end

function source.get_trigger_characters()
	return { "a", "b", "c", ".", "/" }
end

function source.get_keyword_pattern()
	return [[["'].*]] --this thing magically makes it work in strings
end

---@param _ any
---@param callback fun(response: lsp.CompletionResponse?)
function source:complete(_, callback)
	local path = "mods/noita/file/test.txt"
	---@type lsp.CompletionItem
	local item = {
		label = path,
		filterText = path,
		insertText = path,
		kind = cmp.lsp.CompletionItemKind.File,
	}
	---@type lsp.CompletionList
	local response = { isIncomplete = false, items = { item } }
	callback(response)
	print("completer")
end

function source.resolve()
	print("resolve")
end

return source
