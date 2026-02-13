return {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    enabled = false,
    opts = {
        timeout = 1,
        maxkeys = 5,
    },
    init = function()
        require("showkeys").open()
    end,
}
