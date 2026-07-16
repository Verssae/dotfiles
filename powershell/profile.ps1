# Microsoft.PowerShell_profile — zsh/zshrc.symlink 의 Windows(PowerShell 7) 대응.
# 셸 설정은 이 파일 하나로 관리한다. $PROFILE.CurrentUserAllHosts 에 심링크해서 쓴다.

# 비밀 환경변수는 ~/.localrc.ps1 에 (repo 밖)
$localrc = Join-Path $HOME '.localrc.ps1'
if (Test-Path $localrc) { . $localrc }

# SSH 세션 여부 — scoop/winget 은 PATH 에 링크(shim/junction)만 두고 실제 exe 로
# 넘기는데, 이 링크가 SSH 세션에서 통과가 막혀("신뢰할 수 없는 탑재 지점") 실행이
# 깨진다. 그래서 SSH 로 붙었을 땐 링크 의존 도구(fzf/starship)를 건너뛰고 기본
# 프롬프트로 폴백한다.
$IsSshSession = [bool]$env:SSH_CONNECTION

# ------------------------------------------------------------------
# PATH / env
# ------------------------------------------------------------------

$env:EDITOR = 'nvim'

function Add-Path([string]$Dir) {
  if ($Dir -and (Test-Path -LiteralPath $Dir) -and (($env:PATH -split ';') -notcontains $Dir)) {
    $env:PATH = "$Dir;$env:PATH"
  }
}

# bun
Add-Path (Join-Path $HOME '.bun\bin')

# pnpm (macOS: ~/Library/pnpm → Windows: %LOCALAPPDATA%\pnpm)
$env:PNPM_HOME = Join-Path $env:LOCALAPPDATA 'pnpm'
Add-Path $env:PNPM_HOME

# 개인 bin / cargo
Add-Path (Join-Path $HOME '.local\bin')
Add-Path (Join-Path $HOME '.cargo\bin')

# ------------------------------------------------------------------
# aliases (인자를 받는 것은 함수로 정의한다)
# ------------------------------------------------------------------

# eza instead of ls
function ls { eza -al @args }
function ll { eza -lga --icons @args }

# always neovim
Set-Alias vi  nvim
Set-Alias vim nvim

# git (gc/gp/gl 은 PowerShell 기본 별칭을 덮어써 git 단축키로 쓴다)
function gs   { git status -sb @args }
function gb   { git branch @args }
function gc   { git commit @args }
function gca  { git commit -a @args }
function gco  { git checkout @args }
function gac  { git add -A; git commit -m @args }
function gl   { git pull --prune @args }
function gp   { git push origin HEAD @args }
function glog { git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative @args }

# ------------------------------------------------------------------
# functions ($DOTFILES/functions 의 extract, gf 대응)
# ------------------------------------------------------------------

# 압축 해제 (.dmg 등 macOS 전용은 제외, tar/zip/7z 로 대응)
function extract {
  param([Parameter(Mandatory)][string]$Path)
  if (-not (Test-Path -LiteralPath $Path)) { Write-Error "'$Path' 은 유효한 파일이 아님"; return }
  switch -Regex ($Path.ToLower()) {
    '\.zip$'             { Expand-Archive -LiteralPath $Path -DestinationPath . -Force; break }
    '\.(tar\.gz|tgz)$'   { tar -xzvf $Path; break }
    '\.(tar\.bz2|tbz2)$' { tar -xjvf $Path; break }
    '\.tar$'             { tar -xvf  $Path; break }
    default {
      if (Get-Command 7z -ErrorAction SilentlyContinue) { 7z x $Path }
      else { Write-Error "extract: 지원하지 않는 형식이거나 7z 가 없음: $Path" }
    }
  }
}

# 원격 브랜치 체크아웃
function gf {
  param([Parameter(Mandatory)][string]$Branch)
  git checkout -b $Branch "origin/$Branch"
}

# ------------------------------------------------------------------
# history / editing (zsh history + autosuggestions/substring-search 대응)
# ------------------------------------------------------------------

# PSReadLine 은 PowerShell 7 기본 포함. 대화형 콘솔에서만 설정한다.
if ((Get-Module -ListAvailable -Name PSReadLine) -and $Host.Name -eq 'ConsoleHost') {
  Import-Module PSReadLine

  Set-PSReadLineOption -HistoryNoDuplicates
  Set-PSReadLineOption -MaximumHistoryCount 100000

  # autosuggestions 대응: 히스토리 기반 인라인 예측 (리다이렉트 콘솔에선 실패하므로 감쌈)
  try {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle InlineView
  }
  catch { }

  # history-substring-search 대응: ↑/↓ 로 현재 입력 기준 검색
  Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
  Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

# ------------------------------------------------------------------
# fzf / fzf-tab 대응 — PSFzf
# ------------------------------------------------------------------

if (-not $IsSshSession -and (Get-Module -ListAvailable -Name PSFzf) -and (Get-Command fzf -ErrorAction SilentlyContinue)) {
  Import-Module PSFzf
  # Ctrl+t 파일 검색, Ctrl+r 히스토리 검색
  Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
  # 탭 완성을 fzf 로 (fzf-tab 유사)
  Set-PsFzfOption -TabExpansion
}

# ------------------------------------------------------------------
# prompt — starship (zsh: eval "$(starship init zsh)")
# ------------------------------------------------------------------

# starship 설정은 repo 파일을 그대로 사용 (config/starship.toml → ~/.config/starship.toml 심링크)
if (-not $IsSshSession -and (Get-Command starship -ErrorAction SilentlyContinue)) {
  Invoke-Expression (& starship init powershell)
}
