# URL Mapping for Production

Replace these when switching from localhost to public URLs (domain or static IP).

- AUTH_BASE (Keycloak)
  - Dev: http://localhost:9090
  - Prod: https://auth.<domain>
  - Where to change:
    - Angular: src/app/services/keycloak/keycloak.service.ts (url)
    - Spring: application-prod.yaml (issuer-uri = AUTH_BASE/realms/market-mingle)
    - Keycloak client (mm): Root URL/Admin URL/Web origins/Redirect URIs

- API_BASE
  - Dev: http://localhost:8088/api/v1
  - Prod: https://api.<domain>/api/v1
  - Where to change:
    - Angular: src/openapi/openapi.json (servers[0].url) then run `npm run api-gen`, or supply `ApiModule.forRoot({ rootUrl: '...' })`
    - Nginx (UI container) proxies to internal mm-api:8088 — leave unchanged in container setups

- UI_BASE
  - Dev: http://localhost:4200 (dev server) or http://localhost:8080 (UI container)
  - Prod: https://app.<domain>
  - Where to change:
    - Keycloak client mm: Root URL/Admin URL/Redirect URIs/Web origins
    - Backend CORS (BeansConfig.java): add https://app.<domain>

Keep localhost entries in Keycloak and CORS so local dev continues to work.
