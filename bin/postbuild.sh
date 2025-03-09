#!/bin/bash

rm -rf ./.amplify-hosting

mkdir -p ./.amplify-hosting/compute
mkdir -p ./.amplify-hosting/static

# バックエンドのビルド結果をコピー
cp -r ./dist/backend ./.amplify-hosting/compute/default

# フロントエンドのビルド結果をコピー
# ディレクトリ構造を維持しながらコピー
cp -r ./dist/* ./.amplify-hosting/static/
# backendディレクトリは不要なので削除
rm -rf ./.amplify-hosting/static/backend

# node_modulesをコピー
cp -r ./node_modules ./.amplify-hosting/compute/default/node_modules

# publicディレクトリをコピー
cp -r public/* ./.amplify-hosting/static/

# index.jsが存在することを確認
if [ ! -f ./.amplify-hosting/compute/default/index.js ]; then
  echo "Warning: index.js not found in ./.amplify-hosting/compute/default/"
  # もしserver.jsが存在する場合は、index.jsとしてコピー
  if [ -f ./.amplify-hosting/compute/default/server.js ]; then
    echo "Copying server.js to index.js"
    cp ./.amplify-hosting/compute/default/server.js ./.amplify-hosting/compute/default/index.js
  fi
fi

# 明示的にindex.jsをコピー（念のため）
cp -f ./dist/backend/index.js ./.amplify-hosting/compute/default/index.js

# deploy-manifest.jsonをコピー
cp deploy-manifest.json ./.amplify-hosting/deploy-manifest.json

# ファイル構造を確認（デバッグ用）
echo "Listing .amplify-hosting/compute/default directory:"
ls -la ./.amplify-hosting/compute/default/

echo "Listing .amplify-hosting/static directory:"
ls -la ./.amplify-hosting/static/

echo "Listing .amplify-hosting/static/assets directory (if exists):"
if [ -d "./.amplify-hosting/static/assets" ]; then
  ls -la ./.amplify-hosting/static/assets/
else
  echo "assets directory does not exist"
fi
