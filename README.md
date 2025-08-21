# Personal Arch Linux + GNOME Configuration  

This repository contains my personal configuration for **Arch Linux** with a customized **GNOME** environment.  
Feel free to fork it and use it as a template for your own setup.  

![Screenshot 1](./screenshot.png)  
![Screenshot 2](./screenshot2.png)  

---

## How it works  

The `build.sh` script:  
1. Concatenates `init.sh` with all files inside the `parts/` folder.  
2. Embeds configuration files from the `config/` folder into the final output file at specific points.  

This way, you can easily maintain modular configs and generate a single ready-to-use script.  

---

## Adding a new `dconf` configuration  

To export the settings of an extension, run:  

```bash
dconf dump /org/gnome/shell/extensions/my-extension/ > configs/my-extension.conf
```  

Then inside `parts/myNewScript.sh` you can use it: `dconf load /org/gnome/shell/extensions/my-extension < configs/my-extension.conf`