local status, comment = pcall(require, "Comment")
if not status then
	print("ERROR: module \"Comment\" not found")
	return
end

comment.setup()
