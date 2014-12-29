# Use Mac OS X system proxy if it is configured
export HTTP_PROXY=`scutil --proxy | awk '\
    BEGIN { http_proxy_enabled = ""; http_proxy = ""; http_proxy_port = "80"; } \
    /HTTPEnable/ { http_proxy_enabled = 1; } \
    /HTTPProxy/ { http_proxy = $3; } \
    /HTTPPort/ { http_proxy_port = $3; } \
    END { if (http_proxy_enabled) { print http_proxy ":" http_proxy_port; } }'`

export HTTPS_PROXY=`scutil --proxy | awk '\
    BEGIN { https_proxy_enabled = ""; https_proxy = ""; https_proxy_port = "80"; } \
    /HTTPSEnable/ { https_proxy_enabled = 1; } \
    /HTTPSProxy/ { https_proxy = $3; } \
    /HTTPSPort/ { https_proxy_port = $3; } \
    END { if (https_proxy_enabled) { print https_proxy ":" https_proxy_port; } }'`

# Export our proxy data (even if it's blank)
export http_proxy="${HTTP_PROXY}"
export https_proxy="${HTTPS_PROXY}"

# Setup Colors for directories, and alias ls with colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

# Alias to script that allows me to switch from proxies
alias noproxy='/Users/felixmercado/Dev/DevApps/unsetGlobalProxies.sh'
alias withproxy='/Users/felixmercado/Dev/DevApps/setGlobalProxies.sh'

# Export Java Version Directories
export JAVA_6_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

# Export Maven options
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m"
export M2_HOME=/Users/felixmercado/Dev/DevApps/apache-maven-3.0.5
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

#default JDK is 8
export JAVA_HOME=$JAVA_8_HOME

#Make aliases to switch from one Java version to another
alias java6='export JAVA_HOME=$JAVA_6_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'
