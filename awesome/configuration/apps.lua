return {
        --- Default Applications
        default = {
                --- Default terminal emulator
                terminal = "wezterm start",
		editor = os.getenv("EDITOR") or "nvim",
        },
}
