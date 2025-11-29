return {
	init_options = {
		-- includePaths = { "../include", "/home/myuser/includes" },
		format = {
			case = "lower",
			operandSpace = "on",
			quotes = "single",
			align = {
				mnemonic = 8,
				operands = 16,
				comment = 48,
				operator = 0,
				value = 0,
				indentStyle = "space",
				tabSize = 8,
				autoExtend = "line"
			}
		},
		vasm = {
			provideDiagnostics = false -- does not allow for spaces between instruction arguments
		}
	}
}
