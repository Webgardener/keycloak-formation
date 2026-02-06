.PHONY: up down logs ping

up:
	docker compose up -d

down:
	docker compose down -v

logs:
	docker compose logs -f keycloak

ping:
	curl -fsS http://localhost:8080/realms/master/.well-known/openid-configuration | head -c 200 ; echo
	curl -fsS http://localhost:8080/realms/master/protocol/openid-connect/certs | head -c 200 ; echo

