#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd973b122e388001950ba32/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd973b122e388001950ba32
curl -s -X POST https://api.stackbit.com/project/5dd973b122e388001950ba32/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5dd973b122e388001950ba32/webhook/build/publish > /dev/null
