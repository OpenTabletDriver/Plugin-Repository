#!/usr/bin/env bash
shopt -s globstar # Decend into subdirectories
ROOTDIR="$(readlink -f $(dirname ${BASH_SOURCE[0]}))"
[ ! -d "${ROOTDIR}" ] && exit 100;

RESET='\033[0;0m'
ACCENT='\033[0;97m'
ERROR='\033[1;91m'
SUCCESS='\033[1;92m'

print_clr() {
  [ "$#" -ne 2 ] && exit 101;
  printf "$1$2${RESET}\n"
}

test_dep() {
  [ "$#" -ne 1 ] && exit 102;
  if [ -z "$(command -v $1)" ]; then
    printf "Error: '$1' was not found in PATH.\n"
    exit 102;
  fi
}

test_dependencies() {
  test_dep "sha256sum"
  test_dep "jq"
  test_dep "xargs"
}

check_sha256() {
  [ "$#" -ne 2 ] && exit 103;

  printf "  URL:     $1\n"
  printf "  SHA256:  $2\n"

  CURL_OUTPUT=$(curl -sL "$1" | sha256sum)
  REMOTE_SHA256="$(printf ${CURL_OUTPUT% -} | xargs)"

  if [ "${REMOTE_SHA256}" == "$2" ]; then
    print_clr ${SUCCESS} "  Success: ${REMOTE_SHA256}"
  else
    print_clr ${ERROR} "  Failed:  ${REMOTE_SHA256}"
    exit 200;
  fi
}

validate() {
  print_clr ${ACCENT} "Validating '$1'"
  SHA256=$(jq -r '.SHA256' $1)
  DOWNLOAD_URL=$(jq -r '.DownloadUrl' $1)

  check_sha256 "${DOWNLOAD_URL}" "${SHA256}"
}

test_dependencies

for file in ${ROOTDIR}/**; do
  [ "${file: -5}" == ".json" ] && validate "${file}"
done
exit 0