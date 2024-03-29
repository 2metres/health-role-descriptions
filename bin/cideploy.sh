#!/usr/bin/env bash

set -e
set -o pipefail
set -v

cf login -a $CF_API -u $CF_USER -p $CF_PASSWORD

# setup basic auth on the container
#
basicauth() {
  echo "Not setting a password."
}

# main script function
#
main() {
  readonly appname="${APP_NAME}"
  #readonly GITBRANCH="${CIRCLE_BRANCH}"
  #
  #case "${GITBRANCH}" in
  #  master)
  #    appname="${CIRCLE_PROJECT_REPONAME}"
  #    ;;
  #  *)
  #    appname="${CIRCLE_PROJECT_REPONAME}-${GITBRANCH}"
  #    ;;
  #esac

  basicauth
  cf api $CF_API
  cf auth $CF_USER $CF_PASSWORD
  cf target -o $CF_ORG
  cf target -s $CF_SPACE
  cf push $appname
}

main $@
