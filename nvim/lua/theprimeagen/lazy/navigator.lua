return
{
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", 'window left' },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", 'window down' },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", 'window up' },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", 'window right' },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", 'window previous' },
    },
}