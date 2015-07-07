#-------------------------------------------------------------------------------
# SOURCES
#-------------------------------------------------------------------------------
#source $HOME/Repositories/base16-shell/base16-atelierdune.dark.sh

# Load perlbrew
source $HOME/perl5/perlbrew/etc/bashrc

# Load rbenv
eval "$(rbenv init -)"

source $HOME/.bash_colors

#-------------------------------------------------------------------------------
# ALIASES
#-------------------------------------------------------------------------------
# Listing files
alias l='command ls -1'
alias ls='command ls -G'
alias la='ls -AFG'
alias ll='la -lh'

# Navigation
cd() { builtin cd "$@" && ll; }
alias -- ..='cd ..'
alias -- ...='cd ../..'
alias -- ~='cd ~'
alias -- -='cd -'
alias -- ?='lshelp'

# Locations
alias dt='cd $HOME/Desktop'
alias app='cd /Applications'

alias etc='cd /etc'
alias usr='cd /usr'
alias sys='cd /System/Library'
alias lib='cd /Library'

alias ds='cd $HOME'
alias bin='cd $HOME/.bin'
alias dev='cd $HOME/Documents/Development'
alias rep='cd $HOME/Documents/Development/repositories'
alias dtf='cd $HOME/Documents/Dotfiles'
alias dll='cd $HOME/Downloads'
alias doc='cd $HOME/Documents'
alias edu='cd $HOME/Documents/School'
alias web='cd $HOME/Documents/Sites'
alias txt='cd $HOME/Documents/Notes'

# Configuration
alias profile='vim $HOME/.bash_profile'
alias bashrc='vim $HOME/.bashrc'
alias radare='vim $HOME/.radare2rc'
alias reload='source $HOME/.bash_profile'
alias vimrc='vim $HOME/.vimrc'
alias tmuxconf='tmux source-file $HOME/.tmux.conf; tmux display-message "Reloaded"'

# Bash information
alias h='history'
alias j='jobs'
alias manpaths='echo -e "${MANPATH//:/\\n}"'
alias paths='echo -e "${PATH//:/\\n}"'

# Mac OS X information
alias domains="defaults domains | tr -s ', ' '\n'"
alias pkginfo='sudo installer -volinfo -pkginfo -dominfo -pkg'

# Network
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport'
alias flush='dnscacheutil -flushcache && killall -HUP mDNSResponder'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"

# Finder.app
alias cleands="sudo find -x / -name '.DS_Store' -ls -delete"
alias cleanls='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'

# Utilities
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias oman='openman'

# Quick
alias cask='brew cask'
alias diff="git diff --no-index --color-words $@"
alias e='exit'
alias hd='hexdump -C'
alias make='colormake'
alias pip='python -m pip'
alias pip3='python3 -m pip'
alias q='quit'
alias svn='colorsvn'
alias tail='colortail'
alias cgrep='cgrep --color'
alias cgrepr='cgrep --recursive'
alias edit='open -a Sublime\ Text'
alias xcode='open -a Xcode-beta'
alias osxey='osxey --color'

#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*
#~#~#~#~#~#~#~     EXPERIMENTAL ALIASES    ~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ln='ln -v'


#-------------------------------------------------------------------------------
# FUNCTIONS
#-------------------------------------------------------------------------------
prompt_command() {
    if [[ ${EUID} == 0 ]]; then
        PS1="${yellow}[${red}\u${yellow}${white}@${normal}\W${yellow}]${red}#${normal} "
    else
        PS1="${yellow}[${green}\u${yellow}${white}@${normal}\W${yellow}]${green}\$${normal} "
    fi
}
PROMPT_COMMAND=prompt_command;

#diff() { git diff --no-index --color-words "$@"; }

# -- Create a data URL from a file
dataurl() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# -- Create a git.io short URL
gitio() {
    if [ -z "${1}" -o -z "${2}" ]; then
        echo "Usage: \`gitio slug url\`"
        return 1
    fi
    curl -i http://git.io/ -F "url=${2}" -F "code=${1}"
}

# -- Start an HTTP server from a directory, optionally specifying the port
server() {
    local port="${1:-8000}"
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# -- Start a PHP server from a directory, optionally specifying the port
phpserver() {
    local port="${1:-4000}"
    local ip=$(ipconfig getifaddr en1)
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}"
}

# -- Syntax-highlight JSON strings or files
#    Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
json() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript
    else # pipe
        python -mjson.tool | pygmentize -l javascript
    fi
}

# -- All the dig info
digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# -- Escape UTF-8 characters into their 3-byte format
escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo # newline
    fi
}

# -- Decode \x{ABCD}-style Unicode escape sequences
unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo # newline
    fi
}

# -- Get a character’s Unicode code point
codepoint() {
    perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))"
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo # newline
    fi
}

# -- Show all the names (CNs/SANs) listed in SSL certificate for a given domain
getcertnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified."
        return 1
    fi

    local domain="${1}"
    echo "Testing ${domain}…"
    echo # newline

    local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
        | openssl s_client -connect "${domain}:443" 2>&1);

    if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
        local certText=$(echo "${tmp}" \
            | openssl x509 -text -certopt "no_header, no_serial, no_version, \
            no_signame, no_validity, no_issuer, no_pubkey, no_sigdump, no_aux");
            echo "Common Name:"
            echo # newline
            echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//";
            echo # newline
            echo "Subject Alternative Name(s):"
            echo # newline
            echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
                | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2
            return 0
    else
        echo "ERROR: Certificate not found.";
        return 1
    fi
}


#-------------------------------------------------------------------------------
# SHELL COMPLETION
#-------------------------------------------------------------------------------
#complete -W 'NSGlobalDomain' defaults
complete -W 'delete domains export find help import read read-type rename write' defaults
complete -W '--help --print-path --switch --install --version --reset' xcode-select
complete -o 'nospace' -W 'Dock Finder iTerm Mail Safari iTunes SystemUIServer Xcode' killall
complete -W '-alltargets -arch -archivePath -checkFirstLaunchStatus -configuration -derivedDataPath -destination -destination-timeout -dry-run -exportArchive -exportFormat -exportInstallerIdentity -exportLanguage -exportLocalizations -exportPath -exportProvisioningProfile -exportSigningIdentity -exportWithOriginalSigningIdentity -find-executable -find-library -help -jobs -license -list -localizationPath -parallelizeTargets -project -resultBundlePath -scheme -sdk -showBuildSettings -showsdks -skipUnavailableActions -target -toolchain -usage -verbose -version -workspace -xcconfig' xcodebuild

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi


#-------------------------------------------------------------------------------
# SHELL OPTIONS
#-------------------------------------------------------------------------------
# Append to the Bash history file, rather than overwriting it
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE=
HISTTIMEFORMAT='%F %t%t'


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done
