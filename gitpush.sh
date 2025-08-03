#!/bin/bash
# Ganti ini dengan info kamu:
GIT_USERNAME="kok86"
GIT_EMAIL="kokokerja88@example.com"
GIT_REPO="https://github.com/kok86/tiktok_test.git"
echo "Masukkan Personal Access Token (PAT) GitHub (input tidak terlihat):"
read -s GIT_TOKEN
# Set git config
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
# Cek apakah remote origin sudah ada, hapus jika iya
git remote remove origin 2>/dev/null
# Tambahkan remote origin
git remote add origin $GIT_REPO
# Inisialisasi repo jika belum
if [ ! -d ".git" ]; then
    git init
fi
# Tambah semua file & commit
git add .
git commit -m "commit via script"
# Buat branch main
git branch -M main
# Push pakai token lewat HTTPS
# Gunakan format: https://<token>@github.com/username/repo.git
AUTH_REPO="https://${GIT_TOKEN}@github.com/${GIT_USERNAME}/$(basename $GIT_REPO .git).git"
git push -u $AUTH_REPO main
