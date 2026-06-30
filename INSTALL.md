# 🔧 Toolchain Install Guide

Neovim chỉ *edit* code — bạn cần cài sẵn compiler/runtime cho từng ngôn ngữ.
Mason (trong Neovim) tự lo `rust-analyzer`, `clangd`, `codelldb`, `eslint_d`, `prettier`…
nhưng **Rust / Node / C++ thì phải cài tay** như dưới đây.

> Sau khi cài xong tất cả, mở Neovim và chạy `:checkhealth` để kiểm tra.

---

## 🪟 Windows

### 1. Rust
Cách nhanh nhất (PowerShell):
```powershell
winget install Rustlang.Rustup
```
Hoặc tải `rustup-init.exe` từ <https://rustup.rs>.

> Toolchain mặc định của Rust trên Windows là **MSVC**, cần "Visual Studio Build Tools"
> (workload *Desktop development with C++*). Nếu không muốn cài VS, chọn toolchain GNU:
> ```powershell
> rustup default stable-x86_64-pc-windows-gnu
> ```

Kiểm tra:
```powershell
rustc --version
cargo --version
```

### 2. Node.js (qua nvm-windows)
Trên Windows dùng **nvm-windows** (của coreybutler), KHÔNG phải nvm bản Unix:
```powershell
winget install CoreyButler.NVMforWindows
```
Mở **PowerShell mới**, rồi:
```powershell
nvm install lts
nvm use lts
node -v
npm -v
```

### 3. C / C++ (MinGW-w64 qua MSYS2)
Config này dùng `g++` và `#include <bits/stdc++.h>`, nên hợp nhất với **GCC/MinGW**:
```powershell
winget install MSYS2.MSYS2
```
Mở cửa sổ **"MSYS2 UCRT64"** rồi cài compiler:
```bash
pacman -S --needed mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-gdb
```
Cuối cùng **thêm vào PATH** của Windows:
```
C:\msys64\ucrt64\bin
```
(Settings → "Edit the system environment variables" → Environment Variables → Path → New)

Mở PowerShell mới và kiểm tra:
```powershell
g++ --version
gdb --version
```

---

## 🍎 macOS

### 1. Rust
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# mở lại terminal, hoặc:
source "$HOME/.cargo/env"
rustc --version && cargo --version
```

### 2. Node.js (qua nvm)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# mở lại terminal, rồi:
nvm install --lts
nvm use --lts
node -v && npm -v
```

### 3. C / C++
Xcode Command Line Tools cho clang sẵn có:
```bash
xcode-select --install
```
> Lưu ý: `g++` của Apple chỉ là alias cho `clang`, **không có** `<bits/stdc++.h>`.
> Nếu muốn dùng template/`<leader>r` y như trên Windows, cài GCC thật qua Homebrew:
> ```bash
> brew install gcc        # cung cấp g++-14, g++-15…
> ```
> rồi gọi đúng binary (vd `g++-15`) hoặc tạo symlink.

---

## ✅ Sau khi cài

1. Mở `nvim` — Lazy & Mason tự cài plugin + tool lần đầu.
2. `:Mason` — xem/cài LSP, formatter, linter, debug adapter.
3. `:checkhealth` — xác nhận mọi thứ OK.
