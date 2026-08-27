return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      -- メニューを閉じた時点で並び替え/削除(dd や p での編集)を確定させる
      save_on_toggle = true,
      -- 閉じたタイミングでディスク(~/.local/share/nvim/harpoon.json)へも書き出す
      sync_on_ui_close = true,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup(opts)

    local ext = require("harpoon.extensions")
    -- クイックメニュー上で 1-9 を押すとその行のファイルへ直接ジャンプ
    harpoon:extend(ext.builtins.navigate_with_number())
    -- 現在のバッファに当たる行をハイライトし、カーソルもそこへ置く
    harpoon:extend(ext.builtins.highlight_current_file())
  end,
  keys = function()
    local harpoon = require("harpoon")

    local keys = {
      {
        "<leader>m",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon: マークを付ける",
      },
      {
        "<leader>M",
        function()
          harpoon:list():remove()
        end,
        desc = "Harpoon: マークを外す",
      },
      {
        "<C-e>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list(), { title = " Harpoon " })
        end,
        desc = "Harpoon: メニュー",
      },
      {
        "[m",
        function()
          harpoon:list():prev({ ui_nav_wrap = true })
        end,
        desc = "Harpoon: 前のマーク",
      },
      {
        "]m",
        function()
          harpoon:list():next({ ui_nav_wrap = true })
        end,
        desc = "Harpoon: 次のマーク",
      },
    }

    -- M-1〜M-5 で n 番目のマークへ直行。
    -- <C-数字> は端末が <C-1> などを送れないため、以前の設定は実際には効いていなかった。
    for i = 1, 5 do
      table.insert(keys, {
        "<M-" .. i .. ">",
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon: " .. i .. " 番へ",
      })
    end

    return keys
  end,
}
