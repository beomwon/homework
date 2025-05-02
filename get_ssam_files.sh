# 1. 최신 ssam 정보 가져오기
git fetch ssam

# 2. ssam/main 기준으로 모든 파일 목록 가져오기
files=$(git diff --name-only HEAD ssam/main)

# 3. 루프 돌며 내 로컬에 없는 파일만 체크아웃
for file in $files; do
  if [ ! -f "$file" ]; then
    echo "[복사] $file"
    git checkout ssam/main -- "$file"
  else
    echo "[스킵] $file (이미 존재함)"
  fi
done