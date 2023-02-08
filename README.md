# Thoughts

在刚刚开始使用 emacs 时，我倾向于将所有的配置都放在 .emacs 文件中，这一方面方便修改，另一方面也容易找到配置项，不用翻找各种文件。

随着对 emacs 的逐渐了解，我开始将配置分文件存放，为了实现某种意义上的解耦，提高配置的鲁棒性。这样做当然有它的好处，但是现在我再看我都配置时，感觉这是一堆堆在角落的陈旧杂物，某些代码我已经很久没有动过了，而且因为没有注释导致我不能一下子明白它的作用。

在功能相同的情况下，代码肯定是越短越好，越清晰越好，带有清晰陈述越好。考虑到 Windows 上的多文件加载速度以及 use-package 在 emacs 29 中的引入，也许我应该重新尝试单文件主义（笑）。

本仓库存放了我在之前使用过的配置，最后使用的 emacs 版本为 28.2。于 2023-02-09 停止更新。

# yy-emacs —— include-yy 的 emacs 配置

在 v0.1 版本之前，该配置都是基于以下两个仓库的：

- [purcell/emacs.d: An Emacs configuration bundle with batteries included (github.com)](https://github.com/purcell/emacs.d)

- [redguardtoo/emacs.d: Fast and robust Emacs setup. (github.com)](https://github.com/redguardtoo/emacs.d)

在阅读 [这篇文章](https://emacs-china.org/t/emacs/7116) 后，我阅读了 lazycat 的 emacs 配置，他使用了手动 git submodule 的插件管理方式，而不是使用 emacs 自带的包管理。他的 emacs 配置在这里：[manateelazycat/lazycat-emacs: Andy Stewart's emacs (github.com)](https://github.com/manateelazycat/lazycat-emacs)

考虑到手动管理所带来的一些好处，我这里也就选择了 submodule 的管理方法。

本配置目前仍在不断改进中，待大体稳定后我会重写 readme，对自己的配置做一个更加详细的介绍。
