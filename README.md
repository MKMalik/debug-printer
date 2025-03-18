# **Debug Printer - A Simple & Smart Debugging Plugin for Neovim** 🚀  

**Debug Printer** is a lightweight Neovim plugin that automatically generates print/debug statements for selected text, helping you debug faster across multiple programming languages.  

### **✨ Features**  
- 🖱️ **Works in Normal & Visual Mode** – Select words, expressions, or blocks effortlessly.  
- 🔄 **Auto-Detects File Type** – Inserts the correct print statement for Java, Python, JavaScript, C++, and more.  
- ⚡ **Seamless Key Mapping** – Default: `<leader>pp` (configurable).  
- 🔧 **Customizable** – Override print formats and key bindings easily.  

### **📌 Supported Languages**
- **Java** → `System.out.println("var: " + var);`  
- **JavaScript/TypeScript** → `console.log("var:", var);`  
- **Python** → `print("var:", var)`  
- **C++** → `std::cout << "var: " << var << std::endl;`  
- **C** → `printf("var: %d\n", var);`  

### **🛠️ Installation**
#### **Using Lazy.nvim**  
```lua
require("lazy").setup({
  { dir = "~/path/to/debug-printer" }
})
```
#### **Using packpath**
```sh
git clone https://github.com/yourusername/debug-printer ~/.config/nvim/pack/plugins/start/debug-printer
```

### **🚀 Usage**
- **Normal Mode**: Place cursor on a variable → Press `<leader>p`  
- **Visual Mode**: Select text → Press `<leader>p`  
- Print statement is **inserted in the next line automatically**!  

### **⚙️ Customization**
Override key mappings and formats in `init.lua`:  
```lua
require("debug_printer").setup({
  keymap_normal = "<leader>d",
  keymap_visual = "<leader>d",
  print_statements = {
    python = 'print("DEBUG:", %s)',
    javascript = 'console.warn("DEBUG:", %s);',
  }
})
```

### **💡 Why Use Debug Printer?**
- **Faster debugging** without manually typing print statements.  
- **Works with any codebase**, whether small scripts or large projects.  
- **No dependencies**, pure Lua for maximum performance.  

---  
### **📜 License**
MIT License. Contributions are welcome! 🎉  
