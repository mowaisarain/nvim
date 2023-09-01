-- import markdown-preview plugin safely
local setup, mdpreview = pcall(require, "nvim-markdown-preview")
if not setup then
  return
end

-- configure/enable markdown-preview
mdpreview.setup()
