# 长耳听见的那一年

**微型视觉小说 · 全年龄 · 单女主 · 单线 · 约 20–30 分钟**

> 有些声音不会消失，它们只是换了一个人替它们记得。
>
> ——把最后一盘磁带，交给下一个秋天

---

## 一、安卓手机（APK 直装）

**文件：`长耳听见的那一年-v1.0.apk`（221 KB）**

1. 把这个 APK 传到手机（微信/QQ/数据线/网盘都行）；
2. 在手机上点开它，系统会提示"未知来源"，允许安装即可；
3. 桌面会出现「长耳听见的那一年」图标，点开就能玩。

> 提示：部分手机（小米/华为/OPPO 等）需要在"设置 → 安全 → 安装未知应用"里给对应 App（文件管理/浏览器）授权。
> 本 APK 用自签名证书签名，不是应用商店版本，属于正常情况。

**适配情况**

| 项目 | 值 |
| --- | --- |
| 包名 | `com.longer.tape` |
| 最低系统 | Android 7.0（API 24） |
| 目标系统 | Android 14（API 34） |
| 屏幕 | 横屏（自动旋转），全屏沉浸，隐藏状态栏/导航栏 |
| 权限 | 仅 INTERNET / WAKE_LOCK（本地运行，不联网） |
| 内置 | 游戏本体全部内置在 APK 里，**离线可玩，无任何网络请求** |
| 存档 | 用 WebView 的 localStorage，存于应用私有目录，卸载即清除 |

返回键：在正文里按返回 = 回到标题画面；已经在标题画面按返回 = 退出游戏。

## 二、电脑端

- **方式一（推荐）**：双击 `开始游戏.bat`，自动打开 http://127.0.0.1:8809/
- **方式二**：用 Chrome / Edge 直接打开 `dist/index.html`

## 操作

| 操作 | 说明 |
| --- | --- |
| 点击 / 空格 / 回车 | 推进对话（文字还在打字时点击＝立即显示全部） |
| 按住 Ctrl | 跳过已读 |
| A | 自动播放 |
| H | 历史回顾 |
| Esc | 设置 |
| 右上角 | 回顾 / 自动 / 跳过 / 存档 / 读档 / 设置 / 标题 |

存档：5 个手动槽 + 自动存档。

## 三、流程与结局

`序章《空座位》` → `第 1 章《推开播音室的门》` → `第 2 章《变薄的声音》` → `第 3 章《最后一次广播》` → `结局`

共 **4 个关键选项**（另有 1 个章节内的二选一分歧），只影响好感 / 记忆碎片 / True Flag，单线框架不变。

- **True End《下一个秋天》**：四个关键选项全部选"留下 / 一起 / 做完它 / 当你的耳朵"
- **Normal End《把磁带交给下一个秋天》**：未满足条件时的默认结局

## 四、关于素材

本作**没有任何外部素材文件**：

- 22 张场景背景、6 张 CG、女主 5 种表情差分，全部是运行时用程序化水彩 SVG 现场绘制（`src/svg.js` + `src/art.js`）
- 5 首 BGM 与全部音效，都是 WebAudio 实时合成（`src/audio.js`）
- 应用图标也是程序化生成的水彩 PNG（`tools/mkicon.js`）

女主立绘参考 `7117` 文件夹的两张实拍：及肩偏长黑发、圆框金丝细边眼镜、白领深藏青短袖、米色菱形绗缝帆布书包、老树与灰石墙。

## 五、目录结构

```
galgame/
├─ 长耳听见的那一年-v1.0.apk    ← 安卓直装包
├─ 开始游戏.bat                  电脑端一键启动
├─ index.html / dist/index.html  单文件网页版
├─ src/                          源码（svg / art / audio / engine / script0-2）
├─ tools/                        构建与自测脚本
│   ├─ build.js                  打包网页版
│   ├─ build-apk.ps1             打 APK（aapt2 + javac + d8 + zipalign + apksigner）
│   ├─ mkicon.js / mkicons.js    生成应用图标
│   ├─ validate.js / audit.js    剧本校验（标签唯一性、跳转可达性）
│   ├─ live.js / render.js       浏览器自动通关 / 美术预览
├─ android/                      安卓工程
│   ├─ app/src/main/             Manifest / Java / res / assets
│   ├─ sdk/                      Android SDK（构建用，约 300MB，可删）
│   └─ out/LongerHeard-v1.0.apk  构建产物
└─ preview/                      美术预览图与画廊
```

## 六、重新构建

```bat
node toolsuild.js            :: 重新打包网页版（改完 src 后必跑）
node toolsalidate.js         :: 剧本校验
node toolsaudit.js            :: 跳转/分支可达性审计
powershell -ExecutionPolicy Bypass -File toolsuild-apk.ps1   :: 重新打 APK
node toolslive.js "file:///D:/3333/7117/galgame/dist/index.html" 0 full 0  :: 自动通关自测
```

APK 构建链：Android SDK build-tools 34.0.0 + 本机 JDK（PyCharm 自带 JBR）。
签名密钥：`android/longer-debug.jks`（口令 `longer7117`，仅用于本地安装测试）。
