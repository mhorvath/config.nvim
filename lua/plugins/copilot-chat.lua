return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			prompts = {
				AddComments = {
					prompt = "Add short meaningful comments only above the function block. Use the standard format for comments based on the programming language. Use the selected code.",
					system_prompt = "COPILOT_BASE",
				},
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
