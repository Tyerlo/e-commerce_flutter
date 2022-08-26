module.exports = {
	root: true,
	env: {
		es6: true,
		node: true
	},
	extends: ["eslint:recommended", "google"],
	rules: {
		ident: "off",
		quotes: ["error", "double"]
	},
	parserOptions: {
		ecmaVersion: 8
	}
};
