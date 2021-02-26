<!--
 * @Author: Ryan
 * @Date: 2021-02-26 08:58:23
 * @LastEditTime: 2021-02-26 08:58:55
 * @LastEditors: Ryan
 * @Description: 
 * @FilePath: \VPSReady\.ez\README.md
-->
# .ez-bash
benzBrake 自用 bash 功能扩充

## 食用方法
### 下载 .ez-bash
```shell
cd ~
git clone https://github.com/benzBrake/.ez-bash.git
chmod +x .ez-bash/*.bash .ez-bash/*/*.bash
```
### 启用 .ez-bash

修改 `.bash_profile` 加入
```shell
export EZ_HOME=$HOME/.ez-bash
export EZ_THEME=agnoster
export EZ_PLUGINS=""
. ~/.ez-bash/ez.bash
```
重新打开 shell 即可启用