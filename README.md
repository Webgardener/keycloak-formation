# Lab Keycloak



## Prérequis


- tools: Docker et Go
- un peu de lecture: spec OAuth2 https://datatracker.ietf.org/doc/html/rfc6749


## Step 00 — Bootstrap

Start Keycloak:

```bash
docker compose up
```

Admin UI: http://localhost:8080

user/pass: admin/admin

## Step 01 — (Keycloak = IdP)

* Notre app (le **BFF Go**) est un **client OIDC**
* **Keycloak** joue le rôle d’**Identity Provider** (IdP)
  (et donc aussi d’**Authorization Server** au sens OAuth2/OIDC)


```text
User/Browser        Go BFF (Client)          Keycloak (IdP)
    |          |                           |
    | (/login) | --- redirect ---> /auth   |
    |          | <--- code ---- /callback  |
    |          | --- /token ---->          |
    |          | <--- tokens ---           |
```

**Glossaire**

* **IdP (Identity Provider)** : celui qui authentifie l’utilisateur (Keycloak).
* **Client OIDC** : application qui délègue l’auth à Keycloak.
* **Realm** : un “monde” Keycloak avec son issuer, ses clients, ses users.
* **Issuer** : l’identité de l’IdP (ex : `http://localhost:8080/realms/training`).

### Démarrage de l'app

```bash
export CGO_ENABLED=0
go run ./cmd/bff

# l'app écoute sur port 3000: http://localhost:3000/health
```

Nous avons une instance Keycloak et une app en Go (qui ne fait pas grand chose pour l'instant)
Dans la step 2, nous allons commencer à relier notre app à Keycloak.


## Step 2 

git checkout step-2



