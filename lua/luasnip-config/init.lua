local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

vim.keymap.set({ "i", "s" }, "<C-K>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-J>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<C-L>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

local s = ls.snippet
local sn = ls.sn
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local readautofill = function(position, context)
	print(vim.inspect(context))
	return d(position, function()
		return sn(nil, t("example"))
	end, {})
end

ls.add_snippets("all", {
	s("today", t(os.date("%m-%d-%Y"))),
	s(
		"person",
		fmt(
			[[# Place of Work
{}
# Profession
{}
# Place of Resident
{}]],
			{ i(1), i(2), i(3) }
		)
	),
})

ls.add_snippets("python", {
	s(
		"main",
		fmt(
			[[if __name__ == "__main__":
    {}]],
			i(0)
		)
	),
	s(
		"postgres_conn",
		fmt(
			[[
with psycopg2.connect(
    host="{}",
    database="{}",
    user="{}",
    password="{}",
    port="{}"
) as conn:
    # Create a cursor object to execute SQL queries
    try:
        with conn.cursor() as cursor:
            # Execute SQL queries using the cursor
            cursor.execute("{}")

            # Fetch the results of the query
            results = cursor.fetchall()

            # Process the results as needed
            for row in results:
                print(row)
    except psycopg2.errors.QueryCanceled as e:
        print("Query was canceled:", e)
]],
			{ i(1, "localhost"), i(2, "db"), i(3, "user"), i(4, "pass"), i(5, "5433"), i(0) }
		)
	),
	s("test", fmt("your input is: {} now repeat {}", { i(1), rep(1) })),
	s("df", fmt("df_{} = pd.DataFrame('{}')", { rep(1), i(1) })),
	s("fun", fmt("def {}({}):\n  {}", { i(1, "name"), i(2, "arg"), i(0) })),
	s(
		"read",
		fmt(
			[[
{} = '{}'
with {}({},'{}') as {}:
    {} = {}.{}.split('\n')
]],
			{
				i(1, "filename"),
				i(2, "file.csv"),
				c(3, { t("open"), t("h5py.File") }),
				rep(1),
				i(4, "r"),
				i(5, "file"),
				i(6, "data"),
				rep(5),
				i(7, "read()"),
			}
		)
	),
})

ls.add_snippets("javascript", {
	s("fun", fmt("var {} = ({}) =>\n{{\n  {}\n}}", { i(1), i(2), i(0) })),
	s("imp", fmt("import {{{}}} from '{}'", { i(1), i(2) })),
	s("dimp", fmt("import {} from '{}'", { i(1), i(2) })),
	s("rfun", fmt("import {} from '{}'", { i(1), i(2) })),
})

ls.add_snippets("lua", {
	s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
	-- s("rfun", fmt("return {}", { i(1, "default"), rep(1) })),
})

ls.add_snippets("sh", {
	s("#!", fmt("{}", { i(1, "#!/bin/sh") })),
})

ls.add_snippets("yaml", {
	s(
		"compose",
		fmt('version: "{}"\nname: {}\nservices:\n  {}\nvolumes:\n  {}', { i(1, "3"), i(2, "service_name"), i(0), i(3) })
	),
	s(
		"service",
		fmt(
			"{}:\n  build:\n    context: ./{}\n    dockerfile: Dockerfile\n  ports:\n      - {}:{}\n  extra_hosts:\n    - host.docker.internal:host-gateway",
			{ i(1, "service_name"), rep(1), i(2, "8080"), rep(2) }
		)
	),
})

ls.add_snippets("sql", {
	s("show user", fmt("{}", c(1, { t("SELECT * FROM pg_user;"), t("SELECT User, Host FROM mysql.user;") }))),
	s(
		"CREATE _ name WITH PASSWORD",
		fmt("CREATE {} {} WITH PASSWORD '{}';", { c(3, { t("USER"), t("ROLE") }), i(1, "reader"), i(2, "password") })
	),
	s("SELECT * FROM *", fmt("SELECT {} FROM {};", { i(1, "*"), i(2, "table") })),
})

ls.add_snippets("md", {})
