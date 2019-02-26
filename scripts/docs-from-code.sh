#!/usr/bin/env bash
docs_from_code () {
  local dir=$1
  local repo=$2
  local branch=$3

  mkdir "$dir"
  cd "$dir" || exit
  git init
  git remote add origin -f git@github.com:magento-devdocs/"$repo".git
  git config core.sparseCheckout true

  echo '/docs/*' >> .git/info/sparse-checkout

  git checkout "$branch"
  cd ..
}

docs_from_code mftf magento2-functional-testing-framework docs-in-code
docs_from_code page-builder magento2-page-builder ds_docs-in-code