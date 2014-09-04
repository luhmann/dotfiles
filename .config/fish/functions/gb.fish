function gb
	git rev-parse --abbrev-ref HEAD
	git rev-parse --abbrev-ref HEAD | tr -d '\n' | tr -d ' ' | pbcopy
end
