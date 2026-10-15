# DevOps Final — Practice Project (de001 style)

Repo luyện: https://github.com/Tamisimi/devops-final-practice-de001

## Cấu trúc (giống đề)

- `Dockerfile` multi-stage JDK21 / JRE21
- `docker-compose.yml` — mysql + app + nginx
- `student.env` — điền thông tin SV
- `nginx/default.conf` — proxy tới `app:8080`
- `database/init.sql` — 8 lab mẫu
- `.github/workflows/ci-cd.yml` — GHCR + SSH secrets

## Luyện local (Docker Desktop)

```bash
# Sửa student.env (APP_PORT, MYSQL_*)
docker compose --env-file student.env up -d --build
docker compose --env-file student.env ps
curl http://localhost:8088/
curl http://localhost:8088/api/labs
```

## Secrets GitHub (khi có VPS)

- `SERVER_HOST`
- `SERVER_USER`
- `SERVER_SSH_KEY`

```bash
ssh-keygen -t ed25519 -f deploy_key -N ""
# public -> VPS authorized_keys
# private -> SECRET SERVER_SSH_KEY
```

## API thử

- `GET /` — version + danh sách labs JSON
- `GET /api/labs` — list labs
