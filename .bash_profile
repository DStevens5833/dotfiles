# -- Paths
# ------------------------------------------------------------------------------
PATH=$PATH:/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
PATH=$PATH:/Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/usr/bin
PATH=$PATH:/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support
export PATH=/usr/local/bin:/usr/local/sbin:/usr/libexec:$HOME/.bin:$PATH

# -- Manpaths
# ------------------------------------------------------------------------------
#export MANPATH="/usr/pkg/man:$MANPATH"

export TERM='xterm-256color'

# -- Ranger
# ------------------------------------------------------------------------------
export RANGER_LOAD_DEFAULT_RC=FALSE

# -- gdk pixbuf
# ------------------------------------------------------------------------------
export GDK_PIXBUF_MODULEDIR="/usr/local/lib/gdk-pixbuf-2.0/2.10.0/loaders"

# -- Default editor
# ------------------------------------------------------------------------------
export EDITOR="vim"


# -- Always enable colored `grep` output
# ------------------------------------------------------------------------------
export GREP_OPTIONS="--color=auto"
export GREP_COLOR='1;33'
export LSCOLORS="exfxcxgxbxHDHEaBhxdxHx"



# -- Link Homebrew casks in `/Applications` rather than `~/Applications`
# ------------------------------------------------------------------------------
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# -- Runtime paths
# ------------------------------------------------------------------------------
export PKG_CONFIG_PATH=$(brew --prefix)/lib/pkgconfig
#export LUA_PATH=$(lua -e "print('/usr/local/share/lua/5.2/?/?.lua;' .. package.path)")
#export LUA_CPATH=$(lua -e "print('/usr/local/lib/lua/5.2/?/?.so;' .. package.cpath)")
#export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
#export GOPATH=/Users/ds/gocode


# -- Python
# ------------------------------------------------------------------------------
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages
#export SITE_PACKAGES='/usr/local/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages'
#export SITE_PACKAGES='/usr/local/Frameworks/Python.framework/Versions/3.4/lib/python3.4/site-packages'


# -- Set TZ using already configured system setting
# ------------------------------------------------------------------------------
export TZ='America/Chicago'


# -- History
# ------------------------------------------------------------------------------
#export HISTSIZE=32768
#export HISTFILESIZE=$HISTSIZE
#export HISTCONTROL=ignoredups
#export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"


# -- LESS
# ------------------------------------------------------------------------------
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

export LESS_TERMCAP_mb=$(tput setaf 11)                 # mb = enter_blink_mode
export LESS_TERMCAP_md=$(tput setaf 1)                  # md = enter_bold_mode
export LESS_TERMCAP_me=$(tput sgr0)                     # me = exit_attribute_mode
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)          # se = exit_standout_mode
export LESS_TERMCAP_so=$(tput setaf 2; tput rev)        # so = enter_standout_mode
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)          # ue = exit_underline_mode
export LESS_TERMCAP_us=$(tput smul; tput setaf 4)       # us = enter_underline_mode

export LESS_TERMCAP_mr=$(tput rev)                      # mr = enter_reverse_mode
export LESS_TERMCAP_mh=$(tput dim)                      # mh = enter_dim_mode
export LESS_TERMCAP_ZN=$(tput ssubm)                    # ZN = enter_subscript_mode
export LESS_TERMCAP_ZV=$(tput rsubm)                    # ZV = exit_subscript_mode
export LESS_TERMCAP_ZO=$(tput ssupm)                    # ZO = enter_superscript_mode
export LESS_TERMCAP_ZW=$(tput rsupm)                    # ZW = exit_superscript_mode

export MANPAGER="less"
export LESS="--RAW-CONTROL-CHARS"

export XML_CATALOG_FILES=$(brew --prefix)/etc/xml/catalog

[ -f "$BASH" ] && source $HOME/.bashrc
[ -f "$HOME/.iterm2_shell_integration" ] && source "$HOME/.iterm2_shell_integration.bash"
[ -f "$HOME/.private" ] && source "$HOME/.private"

