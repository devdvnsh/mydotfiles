local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- EJS variable interpolation
	s("var", {
		t({ "<%= " }),
		i(1, "variable"),
		t({ " %>" }),
	}),

	-- EJS unescaped variable interpolation
	s("uvar", {
		t({ "<%- " }),
		i(1, "variable"),
		t({ " %>" }),
	}),

	-- EJS comment
	s("com", {
		t({ "<%# " }),
		i(1, "comment"),
		t({ " %>" }),
	}),

	-- EJS if statement
	s("if", {
		t({ "<% if (" }),
		i(1, "condition"),
		t({ ") { %>", "  " }),
		i(0), -- Final cursor position
		t({ "", "<% } %>" }),
	}),

	-- EJS if-else statement
	s("ife", {
		t({ "<% if (" }),
		i(1, "condition"),
		t({ ") { %>", "  " }),
		i(2), -- If block
		t({ "", "<% } else { %>", "  " }),
		i(0), -- Else block
		t({ "", "<% } %>" }),
	}),

	-- EJS for loop
	s("for", {
		t({ "<% for (let " }),
		i(1, "i"),
		t({ " = 0; " }),
		i(1, "i"),
		t({ " < " }),
		i(2, "array"),
		t({ ".length; " }),
		i(1, "i"),
		t({ "++) { %>", "  " }),
		i(0), -- Loop body
		t({ "", "<% } %>" }),
	}),

	-- EJS for-in loop
	s("forin", {
		t({ "<% for (let " }),
		i(1, "key"),
		t({ " in " }),
		i(2, "object"),
		t({ ") { %>", "  " }),
		i(0), -- Loop body
		t({ "", "<% } %>" }),
	}),

	-- EJS while loop
	s("while", {
		t({ "<% while (" }),
		i(1, "condition"),
		t({ ") { %>", "  " }),
		i(0), -- Loop body
		t({ "", "<% } %>" }),
	}),

	-- EJS include
	s("inc", {
		t({ "<%- include('" }),
		i(1, "file"),
		t({ "') %>" }),
	}),

	-- EJS script tag
	s("script", {
		t({ "<script>" }),
		i(0), -- Script content
		t({ "</script>" }),
	}),

	-- EJS style tag
	s("style", {
		t({ "<style>" }),
		i(0), -- Style content
		t({ "</style>" }),
	}),

	-- EJS link tag
	s("link", {
		t({ "<link rel='stylesheet' href='" }),
		i(1, "path"),
		t({ "'>" }),
	}),

	-- EJS image tag
	s("img", {
		t({ "<img src='" }),
		i(1, "src"),
		t({ "' alt='" }),
		i(2, "alt"),
		t({ "'>" }),
	}),

	-- EJS form
	s("form", {
		t({ "<form action='" }),
		i(1, "action"),
		t({ "' method='" }),
		i(2, "method"),
		t({ "'>", "  " }),
		i(0), -- Form content
		t({ "", "</form>" }),
	}),

	-- EJS input field
	s("input", {
		t({ "<input type='" }),
		i(1, "text"),
		t({ "' name='" }),
		i(2, "name"),
		t({ "' placeholder='" }),
		i(3, "placeholder"),
		t({ "'>" }),
	}),

	-- EJS button
	s("button", {
		t({ "<button type='" }),
		i(1, "submit"),
		t({ "'>" }),
		i(0), -- Button text
		t({ "</button>" }),
	}),
}
