return {
	"mattn/emmet-vim",
	event = "InsertEnter",
	config = function()
		vim.g.user_emmet_leader_key = "<C-e>"
		vim.g.user_emmet_settings = { jsx = { "attribute_quotes" == "double" } }
	end,
}
