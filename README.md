# 🎬 HEVC Preview Fix for macOS / macOS 视频预览修复工具

A simple script + Quick Action workflow to fix `.mp4` files encoded in HEVC (H.265) that do not show thumbnails or QuickLook previews on macOS.

一个用于修复 macOS 无法预览 HEVC（H.265）编码 `.mp4` 视频的小工具，支持终端脚本和 Finder 右键快速操作两种使用方式。

---

## ✅ What It Does / 功能说明

- 🧩 Fixes missing video previews in Finder / 修复 Finder 无法显示视频缩略图
- 🎞 Enables QuickLook playback for HEVC `.mp4` / 启用 QuickLook 播放

> 💡 Uses `-tag:v hvc1` to make macOS properly recognize HEVC content  
> 💡 利用 `-tag:v hvc1` 标签让 macOS 正确识别 HEVC 视频

---

## 📦 Requirements / 使用前提

- macOS (10.13+ recommended)  
- FFmpeg installed via Homebrew  
  安装 FFmpeg（使用 Homebrew）:
  ```bash
  brew install ffmpeg
  ```

---

## 🖥 Option 1: Terminal Script / 方式一：终端脚本

### 📥 Setup / 设置方法

```bash
# 1. 下载脚本 Download the script
curl -O https://raw.githubusercontent.com/ruanweiming/HEVC-Preview-Fix/refs/heads/main/hevc-fix-preview.sh

# 2. 赋予执行权限 Make it executable
chmod +x fix-preview.sh
```

### ▶️ Usage / 使用方法

```bash
# 修复单个视频 Fix single file
./fix-preview.sh /path/to/video.mp4

# 批量修复 Fix multiple files
./fix-preview.sh ~/Downloads/*.mp4
```

---

## 🖱 Option 2: Finder Quick Action / 方式二：Finder 快捷操作

### 🧰 Setup / 安装方式

1. 双击 `HEVC Preview Fix.workflow`
2. 它会在 Automator 中打开，请选择“安装”或手动保存到：
   ```
   ~/Library/Services/
   ```

### ✅ 使用方法

- 在 Finder 中选中 `.mp4` 视频
- 右键 → 快捷操作 → HEVC Preview Fix

它会自动修复视频的预览信息，无需其他操作。

---

## 🛠 How It Works / 工作原理

For each `.mp4` file:
- Creates a temporary `.tmp_filename.mp4`
- Copies streams using `-c copy` and adds `-tag:v hvc1`
- Replaces original file only if successful

对每个 `.mp4` 文件：
- 创建一个临时文件 `.tmp_文件名.mp4`
- 用 `-c copy` 保留内容，仅添加 `hvc1` 标签
- 成功后替换原文件，失败则不影响原文件

---

## 📁 File Overview / 文件说明

| 文件 | 说明 |
|------|------|
| `fix-preview.sh` | 终端运行脚本，支持批量处理 |
| `HEVC Preview Fix.workflow` | 可右键运行的 macOS 快捷操作 |
| `README.md` | 使用说明（中英文）|

---

## 📄 License / 许可证

MIT License — free to use, modify, and distribute.  
MIT 协议，允许自由使用、修改和分发。

欢迎 Star / Fork / PR！
