param(
  [string]$UiTag = "mm-ui:prod",
  [string]$ApiTag = "mm-api:prod"
)

Write-Host "Building UI image as $UiTag" -ForegroundColor Cyan
docker build -f ../../docker/frontend/Dockerfile -t $UiTag ../../market-mingle-ui

Write-Host "Building API image as $ApiTag" -ForegroundColor Cyan
docker build -f ../../docker/backend/Dockerfile -t $ApiTag ../../marketmingleV1
