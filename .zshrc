export ZSH="$HOME/.oh-my-zsh"

# java versions
export JAVA_HOME=$(/usr/libexec/java_home -v 17.0.2)
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_16_HOME=$(/usr/libexec/java_home -v16)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)

ZSH_THEME="eastwood"
eval $(thefuck --alias)

plugins=(
  fzf
  git
  gradle
  history
  kubectl
  kubectx
  thefuck
  web-search
  yarn
)

source $ZSH/oh-my-zsh.sh

# History of cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH
path+=/opt/homebrew/bin


# aws aliases
alias staging="ssocred staging && export AWS_PROFILE=staging && kubectx eks-staging && export VAULT_ADDR=http://vault.k8s-product.vault.staging.internal"
alias production="ssocred production && export AWS_PROFILE=production && kubectx eks-production && export VAULT_ADDR=http://vault.k8s-product.vault.production.internal"
alias vault="~/github/pleo-io/pleo/bin/vault-rds-credentials.sh"


# java aliases
alias java8="export JAVA_HOME=$JAVA_8_HOME"  
alias java11="export JAVA_HOME=$JAVA_11_HOME"
alias java16="export JAVA_HOME=$JAVA_16_HOME"
alias java17="export JAVA_HOME=$JAVA_17_HOME"

java17 # default java17

# colima - docker
alias colup="colima start --runtime docker --cpu 2 --memory 4 --disk 20"
alias coldwn="colima stop"

# other alisases
alias zshrc="nano ~/.zshrc"
alias update="source ~/.zshrc"
alias myip="curl http://ipecho.net/plain; echo"

fe() {
  echo $(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
}

fd() {
  cd $(fe)
}

fcode() {
  code $(fe)
}

fidea() {
  idea $(fe)
}
