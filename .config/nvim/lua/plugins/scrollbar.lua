require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
	handle = {
		color = "#3a4659"
	},
	marks = {
		Search = {color = "#a9b83d"}
	},
	handlers = {
		diagnostic = false,
		search = true
	}
})

