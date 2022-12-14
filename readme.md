# jumango doom emacs configuration

## 1. install emacs

- whatever, which has a compatible with doom emacs thats ok i hope

## 2. install doom emacs

``` sh
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

## 3. install compile shell script

- zsh

``` sh
echo "alias compile_emacs_bitch='~/.emacs.d/bin/doom sync'" >> ~/.zshrc
source ~/.zshrc
```

## 4. compile doom emacs bitch

``` sh
compile_emacs_bitch
```

## 5. install dependancies

list of dep:
- node v16
- prettier
- sbcl 
