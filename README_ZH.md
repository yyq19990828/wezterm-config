<h2 align="center">我的 WezTerm 配置</h2>

<p align="center">
  <a href="https://github.com/KevinSilvester/wezterm-config/stargazers">
    <img alt="Stargazers" src="https://img.shields.io/github/stars/KevinSilvester/wezterm-config?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41">
  </a>
  <a href="https://github.com/KevinSilvester/wezterm-config/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/KevinSilvester/wezterm-config?style=for-the-badge&logo=gitbook&color=B5E8E0&logoColor=D9E0EE&labelColor=302D41">
  </a>
  <a href="https://github.com/KevinSilvester/wezterm-config/actions/workflows/lint.yml">
    <img alt="Build" src="https://img.shields.io/github/actions/workflow/status/KevinSilvester/wezterm-config/lint.yml?&style=for-the-badge&logo=githubactions&label=CI&color=A6E3A1&logoColor=D9E0EE&labelColor=302D41">
  </a>
</p>

![screenshot](./.github/screenshots/wezterm.gif)

---

### 功能特性

- [**背景图片选择器**](https://github.com/KevinSilvester/wezterm-config/blob/master/utils/backdrops.lua)

  - 循环切换图片
  - 模糊搜索图片
  - 切换背景图片

  > 使用方法见：[按键绑定](#背景图片)

- [**GPU 适配器选择器**](https://github.com/KevinSilvester/wezterm-config/blob/master/utils/gpu_adapter.lua)

  > :bulb: 仅当 [`front_end`](https://github.com/KevinSilvester/wezterm-config/blob/master/config/appearance.lua#L8) 选项设置为 `WebGpu` 时有效。

  一个用于为你的机器选择最佳 GPU + 适配器（图形 API）组合的小工具。

  选择顺序如下：

  1.  <details>
      <summary>最佳 GPU</summary>

      `离散` > `集成` > `其他`（用于离散 GPU 的 OpenGl 实现）> `CPU`
      </details>

  2.  <details>
      <summary>最佳图形 API（基于实际体验）</summary>

      > :bulb:<br>
      > 可用的图形 API 取决于你的操作系统。<br>
      > 这些选项对应 `wgpu` crate（WezTerm GUI 的 WebGpu 模式）支持的 API。<br>
      > 详见：<https://github.com/gfx-rs/wgpu#supported-platforms>

      - Windows: `Dx12` > `Vulkan` > `OpenGl`
      - Linux: `Vulkan` > `OpenGl`
      - Mac: `Metal`

      </details>

---

### 快速开始

- ##### 依赖要求：

  - <details>
      <summary><b>WezTerm</b></summary>

    最低版本：`20240127-113634-bbcac864`<br>
    推荐版本：[Nightly](https://github.com/wez/wezterm/releases/nightly)

    [官方安装页面](https://wezfurlong.org/wezterm/installation.html)

    **Windows**

    - <details>
      <summary>安装稳定版</summary>

      - Scoop 安装（非便携）

        ```sh
        scoop bucket add extras
        scoop install wezterm
        ```

      - Scoop 安装（便携）

        ```sh
        scoop bucket add k https://github.com/KevinSilvester/scoop-bucket
        scoop install k/wezterm
        ```

      - winget 安装

        ```sh
        winget install wez.wezterm
        ```

      - choco 安装

        ```sh
        choco install wezterm -y
        ```
      </details>

    - <details>
      <summary>安装 Nightly</summary>

      - Scoop 安装（非便携）

        ```sh
        scoop bucket add versions
        scoop install wezterm-nightly
        ```

      - Scoop 安装（便携）

        ```sh
        scoop bucket add k https://github.com/KevinSilvester/scoop-bucket
        scoop install k/wezterm-nightly
        ```
      </details>

    > :bulb:<br>
    > 非便携安装不支持 Toast 通知。<br>
    > 详见 <https://github.com/wez/wezterm/issues/5166>
  
    ---

    **MacOS**

    - <details>
      <summary>安装稳定版</summary>

      - Homebrew 安装

        ```sh
        brew install --cask wezterm
        ```

      - MacPort 安装

        ```sh
        sudo port selfupdate
        sudo port install wezterm
        ```
      </details>

    - <details>
      <summary>安装 Nightly</summary>

      - Homebrew 安装

        ```sh
        brew install --cask wezterm@nightly
        ```

      - Homebrew 升级

        ```sh
        brew install --cask wezterm@nightly --no-quarantine --greedy-latest
        ```
      </details>

    ---

    **Linux**

    参考 Linux 安装页面：<br>
    <https://wezfurlong.org/wezterm/install/linux.html>

    </details>

  - <details>
    <summary>JetBrainsMono Nerd Font</summary>

    Macos 下 Homebrew 安装：

    ```sh
    brew tap homebrew/cask-fonts
    brew install font-jetbrains-mono-nerd-font
    ```

    Windows 下 Scoop 安装：

    ```sh
    scoop bucket add nerd-fonts
    scoop install JetBrainsMono-NF
    ```

    > 更多信息：
    >
    > - <https://www.nerdfonts.com/#home>
    > - <https://github.com/ryanoasis/nerd-fonts?#font-installation>
    </details/>

&nbsp;

- ##### 步骤：

  1.  ```sh
      # Windows 和 Unix 系统通用
      git clone https://github.com/KevinSilvester/wezterm-config.git ~/.config/wezterm
      ```
  2.  完成！🎉🎉

&nbsp;

- ##### 你可能想要修改的内容：

  - [./config/domains.lua](./config/domains.lua) 自定义 SSH/WSL 域
  - [./config/launch.lua](./config/launch.lua) 设置首选 shell 及其路径

---

### 所有按键绑定

大多数按键绑定围绕 <kbd>SUPER</kbd> 和 <kbd>SUPER_REV</kbd>（反向 super）键。

- MacOs：
  - <kbd>SUPER</kbd> ⇨ <kbd>Super</kbd>
  - <kbd>SUPER_REV</kbd> ⇨ <kbd>Super</kbd>+<kbd>Ctrl</kbd>
- Windows 和 Linux：
  - <kbd>SUPER</kbd> ⇨ <kbd>Alt</kbd>
  - <kbd>SUPER_REV</kbd> ⇨ <kbd>Alt</kbd>+<kbd>Ctrl</kbd>

> 这样设计是为了避免在不同操作系统间切换时产生混淆，并避免与系统快捷键冲突。

- 所有平台：<kbd>LEADER</kbd> ⇨ <kbd>SUPER_REV</kbd>+<kbd>Space</kbd>

#### 其他/常用

| 按键                              | 动作                                      |
| --------------------------------- | ----------------------------------------- |
| <kbd>F1</kbd>                     | `激活复制模式`                            |
| <kbd>F2</kbd>                     | `激活命令面板`                            |
| <kbd>F3</kbd>                     | `显示启动器`                              |
| <kbd>F4</kbd>                     | `显示启动器` <sub>（仅标签页）</sub>      |
| <kbd>F5</kbd>                     | `显示启动器` <sub>（仅工作区）</sub>      |
| <kbd>F11</kbd>                    | `切换全屏`                                |
| <kbd>F12</kbd>                    | `显示调试面板`                            |
| <kbd>SUPER</kbd>+<kbd>f</kbd>     | 搜索文本                                  |
| <kbd>SUPER_REV</kbd>+<kbd>u</kbd> | 打开 URL                                  |

&nbsp;

#### 复制与粘贴

| 按键                                          | 动作               |
| --------------------------------------------- | ------------------ |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd> | 复制到剪贴板       |
| <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>v</kbd> | 从剪贴板粘贴       |

&nbsp;

#### 光标移动

| 按键                                   | 动作                                                     |
| -------------------------------------- | -------------------------------------------------------- |
| <kbd>SUPER</kbd>+<kbd>LeftArrow</kbd>  | 光标移动到行首                                           |
| <kbd>SUPER</kbd>+<kbd>RightArrow</kbd> | 光标移动到行尾                                           |
| <kbd>SUPER</kbd>+<kbd>Backspace</kbd>  | 清空当前行 <sub>（PowerShell 或 cmd 下无效）</sub>        |

&nbsp;

#### 标签页

##### 新建与关闭

| 按键                              | 动作                                |
| --------------------------------- | ----------------------------------- |
| <kbd>SUPER</kbd>+<kbd>t</kbd>     | 新建标签页 <sub>（默认域）</sub>    |
| <kbd>SUPER_REV</kbd>+<kbd>f</kbd> | 新建标签页 <sub>（WSL:Ubuntu）</sub>|
| <kbd>SUPER_REV</kbd>+<kbd>w</kbd> | 关闭当前标签页                      |

##### 标签页导航

| 按键                              | 动作         |
| --------------------------------- | ------------ |
| <kbd>SUPER</kbd>+<kbd>[</kbd>     | 下一个标签页 |
| <kbd>SUPER</kbd>+<kbd>]</kbd>     | 上一个标签页 |
| <kbd>SUPER_REV</kbd>+<kbd>[</kbd> | 标签左移     |
| <kbd>SUPER_REV</kbd>+<kbd>]</kbd> | 标签右移     |

##### 切换标签栏

| 按键                          | 动作         |
| ----------------------------- | ------------ |
| <kbd>SUPER</kbd>+<kbd>9</kbd> | 切换标签栏   |

##### 标签页标题

| 按键                              | 动作             |
| --------------------------------- | ---------------- |
| <kbd>SUPER</kbd>+<kbd>0</kbd>     | 重命名当前标签页 |
| <kbd>SUPER_REV</kbd>+<kbd>0</kbd> | 撤销重命名       |

&nbsp;

#### 窗口

| 按键                          | 动作               |
| ----------------------------- | ------------------ |
| <kbd>SUPER</kbd>+<kbd>n</kbd> | 新建窗口           |
| <kbd>SUPER</kbd>+<kbd>=</kbd> | 增大窗口           |
| <kbd>SUPER</kbd>+<kbd>-</kbd> | 缩小窗口           |

&nbsp;

#### 面板

##### 分割面板

| 按键                               | 动作                                           |
| ---------------------------------- | ---------------------------------------------- |
| <kbd>SUPER</kbd>+<kbd>\\</kbd>     | 垂直分割 <sub>（当前面板域）</sub>             |
| <kbd>SUPER_REV</kbd>+<kbd>\\</kbd> | 水平分割 <sub>（当前面板域）</sub>             |

##### 缩放与关闭面板

| 按键                              | 动作                |
| --------------------------------- | ------------------- |
| <kbd>SUPER</kbd>+<kbd>Enter</kbd> | 切换面板缩放状态    |
| <kbd>SUPER</kbd>+<kbd>w</kbd>     | 关闭当前面板        |

##### 面板导航

| 按键                              | 动作                  |
| --------------------------------- | --------------------- |
| <kbd>SUPER_REV</kbd>+<kbd>k</kbd> | 移动到上方面板        |
| <kbd>SUPER_REV</kbd>+<kbd>j</kbd> | 移动到下方面板        |
| <kbd>SUPER_REV</kbd>+<kbd>h</kbd> | 移动到左侧面板        |
| <kbd>SUPER_REV</kbd>+<kbd>l</kbd> | 移动到右侧面板        |
| <kbd>SUPER_REV</kbd>+<kbd>p</kbd> | 与选中面板交换        |

##### 面板滚动

| 按键                          | 动作                               |
| ----------------------------- | ---------------------------------- |
| <kbd>SUPER</kbd>+<kbd>u</kbd> | 向上滚动 <sub>5 行</sub>           |
| <kbd>SUPER</kbd>+<kbd>d</kbd> | 向下滚动 <sub>5 行</sub>           |
| <kbd>PageUp</kbd>             | 向上一页                           |
| <kbd>PageDown</kbd>           | 向下一页                           |

&nbsp;

#### 背景图片

| 按键                              | 动作                       |
| --------------------------------- | -------------------------- |
| <kbd>SUPER</kbd>+<kbd>/</kbd>     | 随机选择图片                |
| <kbd>SUPER</kbd>+<kbd>,</kbd>     | 切换到下一张图片            |
| <kbd>SUPER</kbd>+<kbd>.</kbd>     | 切换到上一张图片            |
| <kbd>SUPER_REV</kbd>+<kbd>/</kbd> | 模糊选择图片                |
| <kbd>SUPER</kbd>+<kbd>b</kbd>     | 切换背景聚焦模式            |

&nbsp;

#### 按键表

> 详见：<https://wezfurlong.org/wezterm/config/key-tables.html>

| 按键                           | 动作        |
| ------------------------------ | ----------- |
| <kbd>LEADER</kbd>+<kbd>f</kbd> | 字体缩放    |
| <kbd>LEADER</kbd>+<kbd>p</kbd> | 面板缩放    |

##### 按键表：`resize_font`

| 按键           | 动作                          |
| -------------- | ----------------------------- |
| <kbd>k</kbd>   | 增大字体                      |
| <kbd>j</kbd>   | 减小字体                      |
| <kbd>r</kbd>   | 重置字体大小                  |
| <kbd>q</kbd>   | 退出                          |
| <kbd>Esc</kbd> | 退出                          |

##### 按键表：`resize_pane`

| 按键           | 动作                                         |
| -------------- | -------------------------------------------- |
| <kbd>k</kbd>   | 调整面板大小（向上）                         |
| <kbd>j</kbd>   | 调整面板大小（向下）                         |
| <kbd>h</kbd>   | 调整面板大小（向左）                         |
| <kbd>l</kbd>   | 调整面板大小（向右）                         |
| <kbd>q</kbd>   | 退出                                         |
| <kbd>Esc</kbd> | 退出                                         |

---

### 参考/灵感来源

- <https://github.com/rxi/lume>
- <https://github.com/catppuccin/wezterm>
- <https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614>
- <https://github.com/wez/wezterm/discussions/628#discussioncomment-5942139>
