#!/bin/bash

rm -rf ./.amplify-hosting

mkdir -p ./.amplify-hosting/compute

cp -r ./dist/backend ./.amplify-hosting/compute/default
# ./dist内の/bakend以外を./.amplify-hosting/staticへコピー
rsync -av --exclude='backend' ./dist/ ./.amplify-hosting/static/

cp -r ./node_modules ./.amplify-hosting/compute/default/node_modules

cp -r public ./.amplify-hosting/static


cp deploy-manifest.json ./.amplify-hosting/deploy-manifest.json