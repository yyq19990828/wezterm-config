local wezterm = require('wezterm')
local platform = require('utils.platform')

-- local font = 'Maple Mono SC NF'
local font_family = 'JetBrainsMono Nerd Font'
local font_size = platform.is_mac and 12 or 15

return {
   font = wezterm.font_with_fallback({
      {
         family = font_family,
         weight = 'Medium',
      },
      'YaHei Mono', -- 你系统已有，等宽中文字体
      'Noto Sans CJK SC', -- 思源黑体简体
      'YaHei Consolas Hybrid', -- 微软雅黑 + Consolas 混合体（也很好）
   }),
   font_size = font_size,

   --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
   freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
   freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
